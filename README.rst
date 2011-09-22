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

The policy is to perform all work on a personal fork. For example, if ``$USER`` wants to work on ``plone.app.PACKAGE``:

  1. Visit ``PACKAGE`` on github (https://https://github.com/plone/plone.app.PACKAGE) and click the ''fork'' button.
  2. ``cd src/plone.app.PACKAGE``
  3. ``git remote add USER git@github.com:USER/plone.app.PACKAGE``
  4. ``git push -u USER``

Notice, that you **do not need to fork the buildout repository itself**, only the package you want to change.

Now you can work on the package(s), committing as you go along and push (to your fork) simply by issuing ``git push``.

Once you're ready and want your changes to be merged into the plone repository, you should **issue a pull request**. Visit your package on github and click ``Pull request`` and fill out the form. Easy peasy!

