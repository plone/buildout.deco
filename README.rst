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

The policy is to perform all work on a branch. Start by creating a branch of the deco buildout itself, naming it after the ticket you are working on, for example like so::

  git checkout -b NEWUI-666-ruby-rewrite

Next, create feature branches for all packages you will work on. For example, if you will work on ``plone.app.cmsui`` do this::

  cd src/plone.app.cmsui
  git checkout -b NEWUI-666-ruby-rewrite

This creates a local feature branch. To push this to github (so that others can access it) you first need to configure a write-enabled remote, as the default remote (``origin``) points to a read-only version on github (this is done, because otherwise people who don't have write access to the plone repository couldn't check out the packages at all). By convention the write-enabled remote is called ``plone``, you can create it like so::

  git remote add plone git@github.com:plone/plone.app.cmsui

Now you can push to it. It's a good idea to do this immediately, eventhough it won't actually push any changes (because there aren't any yet), but the ``-u`` parameter will update the local branch to track the new remote by default. This means that during your work you can simply use ``git push`` and ``git pull`` without specifying the remote every time::

  git push -u plone  

Next you edit ``buildout.cfg`` to update the source definition. In this example you would look for the line::

  plone.app.cmsui                   = git git://github.com/plone/plone.app.cmsui.git

and change it to::

  plone.app.cmsui                   = git git@github.com:plone/plone.app.cmsui.git branch=NEWUI-666-ruby-rewrite

Notice, that you're not only changing the URL but also pointing mr.developer to use the feature branch.

Finally, you need to do the same thing for the buildout itself::

  cd ../..
  git remote add plone git@github.com:plone/buildout.deco.git
  git push -u

.. note:: You only need to do this once per package.
  For example, if you work on other tickets that also touch ``plone.app.cmsui``, you only need to create the branch and push it:: 

    git checkout -b NEWUI-999-more-cowbell
    git push -u plone

Once you're ready and want your changes to be merged onto master, you should **issue a pull request**. Visit your package on github, switch to your NEW-FEATURE branch, click ``Pull request`` and fill out the form. Easy peasy!

If your work encompasses multiple packages you should issue a pull request for each one and reference the others.

Update working packages with upstream changes
=============================================

Before issuing a pull request it's a good idea to update your feature branch with the mainline first::

  git fetch plone
  git merge plone/master --ff

This fetches the upstream changes and applies them to your currently checked out branch (the ``--ff`` avoids creating a merge commit for this, if possible, to not pollute your feature branch).

After you're done working on a package
======================================

Once your feature branch has been merged into the mainline you should switch your local buildout back to master::

  git checkout master
  git pull
  bin/develop -rb


Merging pull requests
=====================

The easiest way is to perform the merge TTW on github itself. If you want to perform this manually, do this for each package:

  1. ``git checkout master`` *(merges are always performed on local checkouts of the master branch)*
  2. ``git pull`` *(make sure your local copy is up-to-date)*
  3. ``git merge --no-ff plone/NEWUI-666-ruby-rewrite`` *(merge in the changes from the feature branch, ``--no-ff`` makes sure that this merge is recorded in the history with a merge commit of its own, which helps keeping the history clean)*
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
