Development buildout for `plone.app.deco`_ and `plone.app.toolbar`_.

.. contents::

Bootstrapping
=============

Check out the buildout, bootstrap and run it, as usual::

    % git clone git@github.com:plone/buildout.deco.git
    % cd buildout.deco
    % cp buildout.cfg.in buildout.cfg

Then uncomment one of the lines under ``extends``, you can find more about them 
at the section ``Projects``. Then run following commands::

    % python bootstrap.py 
    % bin/buildout

You now have all required packages for development checked out via git into
``src/``.


Reportinga bugs 
===============

- toolbar/cmsui related bugs should be reported to `plone.app.toolbar github
  issues`_

- deco related related bugs should be reported to `plone.app.deco github
  issues`_

Running Tests
=============

TODO: need to write this section once we have tests running again.


Generating Documentation
========================

TODO: write it


Configurations
==============

In ``buildout.cfg`` you can select one of the configurations described below:

- ``widgets.cfg``
  TODO: description

- ``toolbar.cfg``
  TODO: description

- ``standardtiles.cfg``
  TODO: description

- ``deco.cfg``

  This setup extends ``toolbar.cfg`` and adds `plone.app.deco`_ to it. Installs
  also `plone.app.layoutpage`_ which is a dexterity content type with layout
  behaviour enabled. This should be a starting point to start development of
  Deco.


.. _`plone.app.widgets`: https://github.com/plone/plone.app.widgets
.. _`plone.app.toolbar`: https://github.com/plone/plone.app.toolbar
.. _`plone.app.layoutpage`: https://github.com/plone/plone.app.layoutpage
.. _`plone.app.toolbar github issues`: https://github.com/plone/plone.app.toolbar/issues
.. _`plone.app.deco`: https://github.com/plone/plone.app.deco
.. _`plone.app.deco github issues`: https://github.com/plone/plone.app.deco/issues
