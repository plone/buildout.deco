Bootstrapping
=============

Check out the buildout, bootstrap and run it, as usual::

    % git clone git@github.com:plone/buildout.deco.git
    % cd buildout.deco
    % cp buildout.cfg.in buildout.cfg
    % python bootstrap.py 
    % bin/buildout

You now have all required packages for development checked out via git into
``src/``.

Running Tests
-------------

.. warn:: TODO: need to write this section once we have tests running again.

Subprojects / Integrations
--------------------------

Since Deco is faily large project there are multiple subproject / integrations
which Deco depends on or is planning to support them in future. You can run
those projects separatly by tweaking buildout.cfg that you copied to the root
of your buildout. Currently you can choose between: 

- toolbar-only.cfg: only install toolbar

- chameleon.cfg: deco with chameleon as templating engine (TODO: need to add it
  back)

- collaboration.cfg: deco with support of jarn collaboration suite (TODO: need
  to add it back again)
