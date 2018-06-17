---
categories:
- mono
layout: journal
title: Easy pull requests from master with git-offload
created: 1470254612
---
When using git, I often find myself committing some work to master locally, and having to move it all to a branch from which I can make a pull request. Then I have to clean up afterwards.

I do this often, yet it's tedious and I still sometimes have to look up the exact format of the git commands. So, I wrote a script to automate it, <code>git-offload</code>.

Simply pass in the new branch name and the remote to you want to push the new branch, and git-offload automatically does the following things:

<ul>
<li>Creates a new branch from your current commit
<li>Pushes that branch to an upstream of your choice
<li>Goes back to the original branch
<li>Resets the original branch to its upstream state
</ul>

You can <a href="https://gist.github.com/mhutch/722fff2315597fc7db28e660423efb5c">download git-offload from Gist</a>.

<script src="https://gist.github.com/mhutch/722fff2315597fc7db28e660423efb5c.js" />
