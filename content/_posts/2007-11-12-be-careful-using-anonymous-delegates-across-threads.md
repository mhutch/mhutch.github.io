---
tags: [ programming languages, mono, csharp, anonymous methods ]
title: Be careful using anonymous delegates across threads
created: 1194917506
redirect_from:
- /node/143
- /journal/2007/11/13/be_careful_using_anonymous_delegates_across_threads
- /journal/2007-11-13/be_careful_using_anonymous_delegates_across_threads
---

Anonymous delegates are incredibly useful, especially in that they can "capture"
variables from a parent scope. Used within a single thread, they are very easy
to understand. However, if you're using them to pass data across threads, you
need to understand how the variable capture works.<!--break-->

_UPDATE: It has been pointed out to me that the premise of this article is
wrong. The compiler specifically avoids this problem by hoisting the captured
variables into an inner class of which the generated method is also an instance
member, and creating a new instance of this class for each call. I'm not sure
what bug I ran into that causes the behaviour I denounced, or whether it was
simply sloppy handling of reference types on my part -- but I feel particularly
stupid having vaguely remembered "inner classes" from reading [Raymond Chen's
fine explanation of
this](http://blogs.msdn.com/oldnewthing/archive/2006/08/02/686456.aspx) over a
year ago, yet not having checked it before posting this article. Nonetheless, I
shall let the article remain as a reminder of the code that this wonderful
feature saves you from having to write. Also, the queue/lock-based code may
still be useful when one needs data passed to the GTK thread in a guaranteed
order._

Consider the following code snippet, in which the "data" variable is captured from the delegate's parent scope.

```csharp
void ProcessIncomingData (string data)
{
    Gtk.Application.Invoke (delegate (object sender, EventArgs e) {
            textBuffer.AddText (data);
        });
}
```

What's wrong with this?

Let's expand the anonymous method into something resembling the compiler-generated code.

```csharp
void ProcessIncomingData (string data)
{
    compilerHoistedVariable = name;
    Gtk.Application.Invoke (new EventHandler (compilerGeneratedMethod));
}

string compilerHoistedVariable = null;

void compilerGeneratedMethod (object sender, EventArgs e)
{
    textBuffer.AddText (compilerHoistedVariable);
}
```

Notice that the variable has been "hoisted" into the class scope, so that the
generated method used for the anonymous delegate can access it. (The actual
compiler-generated code is a bit different, encapsulating the hoisted variables
in an inner class, but the principle is the same).

Now consider what happens if ProcessIncomingData gets called by the
data-processing thread several times before the GTK+ loop gets run and can
handle the invocations. Only the most recent value remains in the
compiler-hoisted variable, and the *earlier data strings are lost*.

This isn't a problem if you're passing transient state, for example the
visibility state of a button. But if you're passing data, think carefully about
the internal mechanics. You may have to implement locking on the shared data
structure.

```csharp
void ProcessIncomingData (string data)
{
    lock (textBufferQueue) {
        textBufferQueue.Enqueue (data);
        if (!queueHandlerRunning) {
            queueHandlerRunning = true;
            Gtk.Application.Invoke (
                delegate (object sender, EventArgs e) {
                    lock (textBufferQueue) {
                        while (textBufferQueue.Count > 0) {
                            textBuffer.AddText (textBufferQueue.Dequeue ());
                        }
                        queueHandlerRunning = false;
                    }
                });
        }
    }
}
bool queueHandlerRunning = false;
Queue<string> textBufferQueue = new Queue<string> ();
```

This could hardly be described as "pretty", and the anonymous delegate has grown
so big that we may as well move its definition out into a conventional method.

Things are easier if the delegate consumer offers an alternate call allowing you
to pass arguments along with the delegate, such as Gtk.Application.Invoke and
its _Invoke (object sender, System.EventArgs args, System.EventHandler d)_
overload.

```csharp
void ProcessIncomingData (string data)
{
    Gtk.Application.Invoke (
        this,
        new dataEventArgs (data),
        delegate (object sender, dataEventArgs e) {
            textBuffer.AddText (dataEventArgs.Data);
        });
}

class dataEventArgs : EventArgs
{
    public string Data;
    public dataEventArgs (string data)
    {
        this.Data = data;
    }
}
```

This is much more verbose than the method with which we started, but at least
you won't lose any data and don't have to worry about locking.

Sadly, the anonymous types in C# 3.0 can't be used to simplify this. For a
start, they don't allow inheritance. One might think that the "object sender"
argument could be abused to pass an anonymous type, however in order to leave
the scope of a method, the anonymous type must be cast to "object". The only way
to access its properties would be via reflection, which would not only be
verbose but would also carry a performance penalty.
