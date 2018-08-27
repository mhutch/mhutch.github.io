---
tags: [ programming languages, gaming, mono, catchup2010, microthreading ]
layout: journal
title: Iterator-based Microthreading
created: 1265004319
redirect_from:
- /node/178
- /journal/2010/02/01/iteratorbased_microthreading
---
Back in May, I was wrapping PhyreEngine and porting the samples to C#. To extend
one of them and demonstrate some of the capabilities of C#,
[Miguel](http://tirania.org/blog) and I decided to use simple iterator-based
microthreading, which simulates multithreading but with many microthreads within
a single real thread. [Unity](http://unity3d.com)> does something like it in
their game engine too. It enables you to use a very imperative style of coding,
as if using a single dedicated thread for each, but without anywhere near the
overhead of real threads.<!--break-->

Here's the usage example we came up initially with that drove my design of the
microthread scheduler:

```csharp
public class Enemy1
{
    public void Init (Scheduler scheduler)
    {
        scheduler.AddTask (Patrol ());
    }

    IEnumerable Patrol ()
    {
        while (alive){
            if (CanSeeTarget ()) {
                yield return Attack ();
            } else if (InReloadStation){
                Signal signal = AnimateReload ();
                yield return signal;
            } else {
                MoveTowardsNextWayPoint ();
                yield return TimeSpan.FromSeconds (1);
            };
        }
        yield break;
    }

    IEnumerable Attack ()
    {
        while (TargetAlive && CanSeeTarget ()){
            AimAtTarget ();
            Fire ();
            yield return TimeSpan.FromSeconds (2);
        }
    }
}
```

The concept is fairly simple. The C# compiler magically transforms this code
into an `IEnumerator` state machine (returned by `IEnumerable.GetEnumerator()`).
Each time `IEnumerator.MoveNext()` is called, your method "iterates": it runs to
the next yield statement, sets the Current property to the value yielded, and
keeps enough state that next time it iterates, it can effectively resume where
it left off. We can yield nulls to give other microthreads a chance to run, or
yield objects to tell the scheduler other things. For example, yielding a
`TimeSpan` could cause the microthread to sleep for that long.

```csharp
interface IEnumerator
{
    bool MoveNext ();
    object Current;
}
```

As you can see, although C# iterators are primarily intended for iterating
through collections, the `yield` keyword can also become effectively something
like a microthread cooperatively yielding. Your method runs until it yields,
then it later resumes from this point, runs to the next yield, and so on.

The class that enumerates your iterator is the scheduler. Before we get to that,
we'll cover the boring bits to set some groundwork. First, we need a class to
encapsulate the task. This holds hold the `IEnumerator` and which `Scheduler` it
belongs to, is a singly linked list node, and has a field for arbitrary data
we'll use later.

```csharp
//tasks may move between lists but they may only be in one list at a time
internal class TaskItem
{
    public readonly IEnumerator Task;
    public TaskItem Next;
    public Scheduler Scheduler;
    public long Data;

    public TaskItem (IEnumerator task, Scheduler scheduler)
    {
        this.Task = task;
        this.Scheduler = scheduler;
    }
}
```

Next we need a simple linked list for keeping lists of `TaskItem`. We're not
using `LinkedList<T>`; this is much simpler, does only what we need, and makes
it easy to move tasks between lists and remove them via the enumerator.

```csharp
internal sealed class TaskList
{
    public readonly Scheduler Scheduler;

    public TaskItem First { get; private set; }
    public TaskItem Last { get; private set; }

    public TaskList (Scheduler scheduler)
    {
        this.Scheduler = scheduler;
    }

    public void Append (TaskItem task)
    {
        Debug.Assert (task.Next == null);
        if (First == null) {
            Debug.Assert (Last == null);
            First = Last = task;
        } else {
            Debug.Assert (Last.Next == null);
            Last.Next = task;
            Last = task;
        }
    }

    public void Remove (TaskItem task, TaskItem previous)
    {
        if (previous == null) {
            Debug.Assert (task == First);
            First = task.Next;
        } else {
            Debug.Assert (previous.Next == task);
            previous.Next = task.Next;
        }

        if (task.Next == null) {
            Debug.Assert (Last == task);
            Last = previous;
        }
        task.Next = null;
    }

    public TaskEnumerator GetEnumerator ()
    {
        return new TaskEnumerator (this);
    }

    public sealed class TaskEnumerator
    {
        TaskList list;
        TaskItem current, previous;

        public TaskEnumerator (TaskList list)
        {
            this.list = list;
            previous = current = null;
        }

        public TaskItem Current { get { return current; } }

        public bool MoveNext ()
        {
            TaskItem next;
            if (current == null) {
                if (previous == null)
                    next = list.First;
                else
                    next = previous.Next;
            } else {
                next = current.Next;
            }

            if (next != null) {
                if (current != null)
                    previous = Current;
                current = next;
                return true;
            }
            return false;
        }

        public void MoveCurrentToList (TaskList otherList)
        {
            otherList.Append (RemoveCurrent ());
        }

        public TaskItem RemoveCurrent ()
        {
            Debug.Assert (current != null);
            TaskItem ret = current;
            list.Remove (current, previous);
            current = null;
            return ret;
        }
    }
}
```

Now we can implement the scheduler. Using the scheduler is very simple. You
register tasks with `RegisterTask(IEnumerable)`, then call `Run()` to run all
the active tasks for one yield iteration each. It handles sleeping and waking up
tasks and removing tasks once they're finished.

```csharp
public sealed class Scheduler
{
    TaskList active, sleeping;

    public Scheduler ()
    {
        active = new TaskList (this);
        sleeping = new TaskList (this);
    }

    public void AddTask (IEnumerator task)
    {
        active.Append (new TaskItem (task, this));
    }

    public void Run ()
    {
        //cache this, it's expensive to access DateTime.Now
        long nowTicks = DateTime.Now.Ticks;

        //move woken tasks back into the active list
        var en =  sleeping.GetEnumerator ();
        while (en.MoveNext ())
            if (en.Current.Data < nowTicks)
                en.MoveCurrentToList (active);

        //run all the active tasks
        en = active.GetEnumerator ();
        while (en.MoveNext ()) {
            //run each task's enumerator for one yield iteration
            IEnumerator t = en.Current.Task;
            if (!t.MoveNext ()) {
                //it finished, so remove it
                en.RemoveCurrent ();
                continue;
            }

            //check the current state
            object state = t.Current;
            if (state == null) {
                //it's just cooperatively yielding, state unchanged
                continue;
            } else if  (state is TimeSpan) {
                //it wants to sleep, move to the sleeping list. we use the Data property for the wakeup time
                en.Current.Data = nowTicks + ((TimeSpan)state).Ticks;
                en.MoveCurrentToList (sleeping);
            } else if (state is IEnumerable) {
                throw new NotImplementedException ("Nested tasks are not supported yet");
            } else {
                throw new InvalidOperationException ("Unknown task state returned:" + state.GetType ().FullName);
            }
        }
    }

    internal void AddToActive (TaskItem task)
    {
        active.Append (task);
    }
}
```

At this point, it looks fairly useful, but let's add a simple synchronization
primitive too. Microthreads should never make long blocking calls because they
can't be pre-empted. Instead, we're going to let the microthread obtain and
yield a signal object,  which means it will not be scheduled until the signal
has been set. Instead of using blocking APIs, you can use async APIs, create a
signal object, wait on that, and have the callback set the signal. Or, thinking
back to the initial game example, some game object's controlling microthread
might want to sleep until another game object reaches a certain state; the
target object can keep a signal accessible via a property that microthreads can
read and wait on.

A thread can wait for more that one signal, and more than one thread can wait
for a signal. Essentially we're going to have an equivalent of .NET's
`AutoResetEvent` and `WaitHandle.WaitAll(WaiHandle[])`.

The signal's job is to keep a list of all the tasks that are waiting for it.
When tasks start waiting, they move out of the scheduler's lists and are tracked
by all the signals instead. Each signal increments/decrements the task's `Data`
property to keep track of how many signals the task is waiting for. When the
count reaches zero, the task can be moved back to the scheduler.

```csharp
public class Signal
{
    static int nextId = int.MinValue;

    int id = nextId++;
    List<TaskItem> tasks = new List<TaskItem> ();
    bool isSet = true;

    public void Set ()
    {
        if (isSet)
            return;
        isSet = true;
        //decrement the wait count of all tasks waiting for thsi signal
        foreach (TaskItem task in tasks)
            if (--task.Data == 0)
                //if the wait count is zero, the task isn't waiting for any more signals, so re-schedule it
                task.Scheduler.AddToActive (task);
        tasks.Clear ();
    }

    internal void Add (TaskItem task)
    {
        //signal only becomes unset when it has tasks
        if (isSet)
            isSet = false;
        //the signal keeps a list of tasks that are waiting for it
        tasks.Add (task);
        //use the task's data for tracking the number of signals it's still waiting for
        task.Data++;
    }
}
```

And we need to add a couple more checks to the `Scheduler.Run()` state handling,
so that when the task returns a signal or collection/array of signals, it's
moved from the scheduler's lists to the tasks' lists.

```csharp
} else if (state is Signal) {
    TaskItem task = en.RemoveCurrent ();
    task.Data = 0;
    ((Signal)state).Add (task);
} else if (state is ICollection<Signal>) {
    TaskItem task = en.RemoveCurrent ();
    task.Data = 0;
    foreach (Signal s in ((ICollection<Signal>)state))
        s.Add (task);
}
```

And, there it is.

I have a few more ideas to improve this and turn it into a real library:

* Implement a `Signal` that's a `ManualResetEvent` analogue
* Use a `IEnumerable<ThreadState>` instead of plain `IEnumerable`, where
  `ThreadState` is a union struct with an enum specifying its type. This could
  be used to avoid the boxing of `TimeSpan` and the type checks and casts in the
  scheduler &mdash; just switch on the enum value. It would also prevent
  consumers returning a zero `TimeSpan` instead of null.
* Dispose any disposable task IEnumerators
* Implement task priorities, probably using different lists
* Tidy up the accessibility and API a bit
* Add a Scheduler.Run overload that only runs some number of iterations, not the
  whole list.

Some people may wonder why I haven't mentioned interactions with real threads.
If the scheduler were thread-aware, then you could have multiple real threads on
different cores consuming the microthread queue, and it would be faster with
multiple cores and avoid blocking on slow tasks. The problem is not just that
this increases the complexity, but that the microthreads all would have to be
aware of threading too, and would need to lock all the objects they touched, and
so on. This scheduler is meant to run in the equivalent of the GUI thread,
purely to enable driving high-level game logic (and similar things) with an
intuitive thread-like imperative programming model, and minimal overhead. If it
doesn't fit easily on one core you're probably using it for the wrong thing.
There might be cases where it's useful to create multiple Schedulers, and run
them in different thread, but be careful about what the microthreads touch.

_This is part of the [Catchup 2010](http://mjhutchinson.com/tags/catchup2010) series of posts_
