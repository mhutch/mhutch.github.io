---
tags: [ mono ]
title: Easy pull requests from master with git-offload
created: 1470254612
redirect_from:
- /node/237
- /journal/2016/08/03/easy_pull_requests_from_master
---
When using git, I often find myself committing some work to master locally, and
having to move it all to a branch from which I can make a pull request. Then I
have to clean up afterwards. I do this often, yet it's tedious and I still
sometimes have to look up the exact format of the git commands. So, I wrote a
script to automate it, `git-offload`.<!--break-->

Simply pass in the new branch name and the remote to you want to push the new
branch, and git-offload automatically does the following things:

* Creates a new branch from your current commit
* Pushes that branch to an upstream of your choice
* Goes back to the original branch
* Resets the original branch to its upstream state

You can [download git-offload from
Gist](https://gist.github.com/mhutch/722fff2315597fc7db28e660423efb5c).

{% gist 722fff2315597fc7db28e660423efb5c %}