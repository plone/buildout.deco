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


Configurations
==============

In ``buildout.cfg`` you can select one of the configurations described below:

- ``toolbar-1.0.cfg``

  This is setup for `plone.app.toolbar`_ version 1.0, which replaces old green
  editing toolbar with Twitter Bootstrap like toolbar. Although toolbar is
  rendered inside iframe all links - when clicked - will open in top frame.

- ``toolbar-2.0.cfg``

  This is setup for `plone.app.toolbar`_ version 2.0, which builds upon
  version 1.0 and opens toolbar links inside overlay which is placed inside
  iframe. This should give us separation of backend and frontend theming.

- ``deco-1.0.cfg``

  This is setup for `plone.app.deco`_ version 1.0 also known as Deco Lite.
  Intention of Deco Lite is to bring Deco idea closer to current Plone 4 user
  experience and not so radically change the way Plone is being used.

- ``deco-2.0.cfg``

  This is setup for `plone.app.deco`_ version 2.0. Difference from 1.0 version
  is that it includes `plone.app.toolbar`_ version 2.0 which includes CMSUI
  functionality. This is also setup which you can use to develop both on
  toolbar and deco.


.. _`plone.app.toolbar`: https://github.com/plone/plone.app.toolbar
.. _`plone.app.toolbar github issues`: https://github.com/plone/plone.app.toolbar/issues
.. _`plone.app.deco`: https://github.com/plone/plone.app.deco
.. _`plone.app.deco github issues`: https://github.com/plone/plone.app.deco/issues
