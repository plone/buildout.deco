Advanced Usage
==============


Trying to explain from the top down, when request comes and what is served
back, how deco/toolbar is applied to the page:


 - To install Deco select plone extension ``Deco`` which will install
   everything needed (or import `plone.app.deco:default` profile). This will
   install additional packages:

    - `plone.app.toolbar`: toolbar which is used for deco editor buttons
    - `plone.app.blocks`:
    - `plone.app.tiles`:
    - `plone.app.contentlistingtile`:
    - `plone.app.imagetile`:
    - `plone.app.contenttile`:
    - `plone.app.texttile`:
    - `plone.app.layoutpage`:
    - `plone.app.registry`: used for storing etc... (included in Plone 4.2)

 - at installation of `plone.app.toolbar` also `toolbar` skin is created. its
   resources (css/js) are later used inside toolbar iframe. this provides us
   with separate skin for "frontend" and "backend" while still showing them on
   same page.

 - TOOLBAR:

    - `plone.toolbar.toolbarlink` viewlet is put above `plone.head` viewlet

    - `plone.contentviews`, `plone.contentactions` and
      `plone.resourceregistries.kineticstylesheets` viewlet are removed /
      hidden.

    - last 2 steps are applied as part of `plone.app.toolbar.bbb:default` profile.

    - in case browser has javascript disabled `plone.toolbar.toolbarlink`
      viewlet will show link which will point to `@@plone_toolbar_fallback`
      view (`plone.app.toolbar.toolbar.FallbackToolbar`) which lists all
      avaliable actions in plain html.

    - in (usual) case when javascript is enabled, `plone.toolbar.toolbarlink`
      viewlet will insert initialization code for `plone.toolbar.js`.

    - `plone.toolbar.js` script is taking care of creation of toolbar. at
      initialization `plone.toolbar.js` creates iframe, loads iframe resources
      and creates list of buttons which are "calculated" in
      `plone.app.toolbar.toolbar.Toolbar`.
