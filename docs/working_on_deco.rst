Working on Deco
===============

Deco is still work in progress. If you want to help finish it, there are
some pointers below for how to get involved.

Development Buildout
--------------------

There is a development buildout at
https://github.com/plone/buildout.deco.

Source Code
-----------

The code for ``plone.app.deco``, ``plone.app.tiles``, and the other packages all live in the primary Plone source code repository at https://github.com/plone/. Note that you must have signed a Plone Contributor Agreement before you can have access to commit to this repository.

Reporting bugs
--------------

Bugs for Deco and all of the related technologies such as Tiles, Blocks and Toolbar are all tracked in the github issues system.

Issues specific to Deco, Tiles and Blocks should be reported in the Deco issues tracker: https://github.com/plone/plone.app.deco/issues

Issues specific to Toolbar or CMSUI should be reported in the Toolbar issues tracker: https://github.com/plone/plone.app.toolbar/issues

If you are unsure, but have a hunch that your issue is related to one of Deco's many parts, report it in the main Plone issue tracker located at https://dev.plone.org/ and it will get triaged and placed in the correct place.

i18n
----

All message strings should be in the Plone domain. If you need to add any
Plone 5 packages to extract messages, you only have to add in to plone5
variable in experimental/i18n.cfg and run the buildout. You can do bin/i18n
plone5 at any moment and if there is no error you can commit the changes from
src/plone.app.locales/plone/app/locales/locales-future

