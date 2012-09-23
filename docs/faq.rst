==========================
Frequently Asked Questions
==========================

Below, we will attempt to answer some frequently asked questions about Deco,
Blocks and Tiles.

How do I theme a site using Deco and Blocks?
--------------------------------------------

You may have realised that it is possible to "theme" a site using site
layouts, by placing global elements and branding on the site layout itself.

This may be appropriate for simple sites with minimal branding needs: as a
rule of thumb, if you think you could construct your branding with the Deco
visual editor only,  using site layouts to contain your visual identity may
be appropriate.

There are some caveats, however:

* It is best to keep your site layouts focused on semantic layout, e.g. using
  names such as "Article" or "Landing page". If content authors choose site
  layouts for their pages and sections based mainly on visual identity, it
  will be harder to reuse content or rebrand the site later.
* You may choose to let content authors or site administrators have the
  permission to create new site layouts or edit the contents of site layouts
  (e.g. to manage global elements such as advertisement or notifications). If
  the site layout is complex, it may be difficult to maintain visual
  consistency across multiple site layouts.

Hence, we would generally recommend that you keep your site layouts as
semantic and simple as possible, and apply a visual identity using `Diazo`_
and `plone.app.theming`_. Deco and Diazo are designed to work together, with
Deco focused on site layout as it pertains to content management and editing,
and Diazo focused on branding and theming.

What happens to viewlets?
-------------------------

In Plone 3 and 4, viewlets are used for two purposes:

1. As a means of breaking the main site layout templates up into smaller
   chunks that can be independently managed.
2. As a means for third-party add-ons to inject bits of markup into the page
   at predefined locations (e.g. "above content" or "below content") without
   the need to customise global page templates.

The first of these is problematic in a some ways. For example, it relies on a
mixture of global registration (ZCML) and local, persistent configuration (the
``viewlets.xml`` GenericSetup import step) to control what is shown and in
what order. It also makes it difficult to understand how the final page will
look by inspecting ``main_template``.

Hence, this pattern of using viewlets is superseded by tiles. Tiles are simply
placed into the relevant site layout. The ordering of tiles is controlled by
the ordering of the relevant tile placeholders. As a bonus, tiles are easier
to write than viewlets and can have associated configuration.

The second use of viewlets is entirely legitimate, of course. Here, specific
ordering should matter less (a third-party add-on cannot know which other
third-party add-ons may be adding content in the same viewlet managers), and
the focus becomes on semantic or semi-semantic locations on the page in which
viewlets can be inserted. This is indeed closer to the original purpose of
viewlets.

For this pattern, there is a tile called
``@@plone.app.standardtiles.viewletmanager``, which looks up and renders a
viewlet manager. For example, the default sitelayout in Deco contains::

    <link  rel="tile" target="abovecontent-viewlets"
        href="./@@plone.app.standardtiles.viewletmanager/above-content?manager=plone.abovecontent" />

Note that the tile takes a parameter, ``manager``, giving the name of the
viewlet manager to look up and render. For viewlet managers rendered in the
head of the page, we use::

    <link  rel="tile"
        href="./@@plone.app.standardtiles.viewletmanager?manager=plone.htmlhead&amp;section=head" />

This ensures the contents of the viewlet manager are rendered in the
``<head />`` of the tile, not the ``<body />``.

What happens to portlets?
-------------------------

Portlets should likely be replaced by tiles. This will require some
refactoring, as tiles are considerably simpler than portlets. This simplicity
is a good thing though: tiles are faster and easier to write and much easier
to understand.

There is a conceptual difference too: Instead of having portlet managers that
acquire and block portlets from the content hierarchy, the sort of content and
dynamic behaviour that is managed in portlets in Plone 3 and 4 would instead
be modelled by tiles placed directly onto the appropriate site layout(s).

If the situation warrants, the relevant tile could of course use some more
abstraction e.g. to model inheritance of settings. In most cases, this should
not be necessary, though: websites generally have only a handful of different
layouts, which in Plone 4 sometimes require an elaborate dance of portlet
assignment, inheritance and blocking.

To users, there is really no distinction between app tiles used for things
like a navigation tree or a listing of news items (both of which are portlets
in Plone 4) and app tiles used for things like a poll or content listing on
a page. With Deco-managed site layouts, tiles can be placed onto the layout
wherever they are most appropriate, and there is no need to write ZCML and/or
Python code to insert another portlet manager if you don't have a three-column
layout.

There is, however, a "legacy" tile that can be used to render a the contents
of a portlet manager, thus allowing existing portlets to be managed and
rendered in the same way they are in Plone 4. For example::

    <link  rel="tile" target="left-portlets" 
        href="./@@plone.app.standardtiles.portletmanager/left-portlets?manager=plone.leftcolumn" />

What happens to content types?
------------------------------

Traditionally, achieving a particular non-trivial layout in a way that is
consistent site wide has required the creation of a new content type. With
Deco and page categories, many existing types can be thought of simply as
pages with different layouts.

For example:

+--------------+-------------------------------------------------------------+
| Plone 4 type | Deco equivalent                                             |
+==============+=============================================================+
| Page         | The standard page type with a simple default layout.        |
+--------------+-------------------------------------------------------------+
| Event        | A new category of page with a template page layout that     |
|              | includes the relevant metadata field tiles such as start    |
|              | and end dates.                                              |
+--------------+-------------------------------------------------------------+
| News Item    | A new category of page with a layout that places a lead     |
|              | image underneath the title.                                 |
+--------------+-------------------------------------------------------------+
| Folder       | Pages can have sub-pages. This replaces the insanely        |
|              | confusing (to most users) "default page" concept. If you    |
|              | need a folder listing, you can place a folder listing       |
|              | tile on the page.                                           |
+--------------+-------------------------------------------------------------+
| Collection   | The collections query builder is a tile: hence, a           |
|              | Collection becomes simply a page with an instance of        |
|              | that tile on it.                                            |
+--------------+-------------------------------------------------------------+

Of course, page categories are treated as first-class content types everywhere
in Plone, so they can used in catalog queries, for example.

The remains are:

* *Page* and its variants
* *File*, which should handle both files and images, making image operations
  and behaviours available when dealing with a binary of an image MIME type.
* Any custom, forms-driven types: Dexterity (and in particular its
  through-the-web) types creation facilities provide an excellent way to model
  organisation-specific data structures with forms-driven data entry as the
  primary content management paradigm. Such types can have view templates that
  specify a site layout, or simply use the standard ``main_template`` macros,
  which in turn will use the default (global or section-specific) site layout.

What if I want a variable-width layout?
---------------------------------------

The grid system we are currently looking at, Bootstrap, does offer some level of support for variable-width layouts. With some work you could change the grid system used by deco to suite your needs.

What about accessibility?
-------------------------

There’s nothing about the new approach that is less accessible than the previous approach in Plone 4. You can always choose to give up the layout model and write HTML/STX/reST/Markdown etc. instead, which is probably a better approach at least for blind people. That being said, you can tab between different tiles when you edit, and it should be possible to get most of it working even from an accessibility perspective.

What about using alternative visual editors?
--------------------------------------------

We'll be using two terms to talk about this, just so we don't get confused:

* Formatting: Simple text formatting tasks. Examples: Bold/italics, headlines, lists. Explicitly not about things like images, and possibly not even something as complex as tables.
* Layout: Adding richer content like images, videos, audio, using “tiles” — essentially the unification of portlets and viewlets. Layout also deals with positioning of these tiles using drag and drop, and is implemented in the DOM, outside of contentEditable.

In a nutshell, we're moving as much as we can of the layout responsibilities outside of the contentEditable (think TinyMCE) implementations in the different browsers.

So what does this mean? It means that pretty much any editor can perform the required tasks, since we are de-scoping its responsibilities quite extensively.

