Bootstrapping
=============

Check out the buildout, bootstrap and run it, as usual::

    git clone git@github.com:plone/buildout.deco.git
    [...]
    cd buildout.deco
    python2.6 bootstrap.py 
    [...]
    ./bin/buildout
    [...]

You now have all required packages checked out via git into ``src/``, but they all point to a read-only URL, so you cannot (accidentally or not) push local changes to the plone repository. To get your changes into the plone repositry read on.

Working on packages
===================

The policy is to perform all work on a personal fork, rather work on branches inside the plone repository. For example, if ``$USER`` wants to work on ``plone.app.PACKAGE``:

  1. Visit ``PACKAGE`` on github (https://github.com/plone/plone.app.PACKAGE) and click the ''fork'' button.
  2. ``cd src/plone.app.PACKAGE``
  3. ``git remote add USER git@github.com:USER/plone.app.PACKAGE``
  4. ``git push -u USER``

Notice, that you **do not need to fork the buildout repository itself**, only the package you want to change.

Now you can work on the package(s), committing as you go along and push (to your fork) simply by issuing ``git push``.

Eventhough you're now working on your own fork, it's still a good idea to work on a separate branch, like so::

  git checkout -b NEW-FEATURE

Once you're ready and want your changes to be merged into the plone repository, you should **issue a pull request**. Visit your package on github, switch to your NEW-FEATURE branch, click ``Pull request`` and fill out the form. Easy peasy!

Update working packages with upstream changes
=============================================

Before issuing a pull request it's a good idea to update your feature branch with the mainline first::

  git fetch origin
  git merge origin/master --ff

This fetches the upstream changes and applies them to your currently checked out branch (the ``--ff`` avoids creating a merge commit for this, of possible). You can then, optionally, push those updates to your fork with ``git push``.

After you're done working on a package
======================================

Once your feature branch has been merged into the mainline you should switch your local checkout back to follow the plone repository. This way it's easier to keep it up-to-date (i.e. by using mr.developer)::

  cd src/plone.app.PACKAGE
  git checkout master
  git pull

If you don't do this, re-running buildout or issuing ``bin/develop up`` will ignore this package and you end up with stale versions (unless you constantly merge in upstream changes, which quickly becomes tedious.)

Merging pull requests
=====================

The easiest way is to perform the merge TTW on github itself. If you want to perform this manually, you need to add the plone repository with a read-write url, like so::

  cd src/plone.app.PACKAGE
  git remote add plone git@github.com:plone/plone.app.PACKAGE

Next, you will also need to add a remote for the fork you want to merge from::

  git remote add USER git@github.com:USER/plone.app.PACKAGE

Now you need to fetch the user's changes::

  git fetch USER

Finally, you can perform the actual merge:

  1. ``git checkout master`` *(merges are always performed on local checkouts of the master branch)*
  2. ``git pull`` *(make sure your local copy is up-to-date)*
  3. ``git merge --no-ff USER/master`` *(merge in the changes from the fork, ``--no-ff`` makes sure that this merge is recorded in the history with a merge commit of its own, which helps keeping the history clean)*
  4. ``git push plone`` *(if/once the merge was successful, push it back to github.)*


Setting up bash completion & prompt
===================================

There are two optional 'goodies' that make working with git a lot easier: **tab completion** (for git commands, branch names and remotes) and a **shell prompt** that shows which branch you're currently working on. Highly recommended!

The easiest way to set this up is to download the following gist: https://gist.github.com/1240533 and save the two files it contains to your home directory.

Then add the line ``source ~/git-completion-config`` to either ``~/.bashrc``, ``~/.profile`` or ``.bash_profile`` (whichever you're using). If none of these files exist, it's safe to create ``~/.profile`` and just add the line above.

The status prompt containts the following information:

 * the name of the currently checked out branch
 * if the current branch is tracking a remote it will display its name, too. this way you can see at a glance where you git will pull from and push to when you don't specify a remote. this means you can use ``git pull`` and ``git push`` with the same simplicity as ``svn up`` and ``svn commit``.
 * it will also tell you if you have any uncommitted files, by adding a ``*``.
 * it will tell you if your local checkout is ahead, behind or up-to-date by adding ``>``, ``<`` or ``=`` respectiviely.
