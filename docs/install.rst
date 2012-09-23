===============
Installing Deco
===============

To install Deco, add ``plone.app.deco`` to your buildout and install the ``Deco`` extension profile into a Plone site. This will install:

* ``plone.app.deco``, the Deco editor and resources
* ``plone.app.blocks``, the Blocks rendering engine
* ``plone.tiles`` and ``plone.app.tiles``, which allow tiles to be created
  and managed.
  sites.
* ``plone.app.toolbar``, which provides the separation of Plone's CMS UI
  into a separate, isolated toolbar.

To test it, add an item of the newly installed ``Deco Page`` type to your site.

Note that Deco and ``plone.app.toolbar`` significantly affect the way a Plone site is used and operates. You should take care if installing on an existing site and test carefully.

