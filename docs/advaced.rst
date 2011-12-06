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
    - `plone.app.texttile`: 
    - `plone.app.layoutpage`: 
    - `plone.app.registry`: used for storing etc... (included in Plone 4.2)

 - at installation of `plone.app.toolbar` also `toolbar` skin is created. its
   resources (css/js) are later used inside toolbar iframe. this provides us
   with separate skin for "frontend" and "backend" while still showing them on
   same page.

 - `toolbar.js` and `toolbar.css` () is added to default bundle. default bundle
   means that this will (or at least it should ) be included in every theme.

 - `plone.toolbar.toolbarlink` viewlet is put above `plone.head` viewlet

 - To `plone.contentviews`, `plone.contentactions` and
   `plone.resourceregistries.kineticstylesheets` viewlet NullViewlet is applied
   which removes/disables its content.

 - last 2 steps are applied as part of `plone.app.toolbar:z_bbb` profile.

 - in case browser has javascript disabled `plone.toolbar.toolbarlink` viewlet
   will show link which will point to `@@plone_toolbar_fallback`
   (`plone.app.toolbar.toolbar.FallbackToolbar`) which lists in plain html all
   avaliable actions.

 - in (usual) case when javascript is enabled, `plone.toolbar.toolbarlink`
   viewlet will insert initialization code for `toolbar.js`.

 - at initialization `toolbar.js` creates iframe, loads list of buttons which
   are "calculated" in `plone.app.toolbar.toolbar.Toolbar`.
