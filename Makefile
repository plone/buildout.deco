NIX_PATH=~/.nix-defexpr/channels/

all: bootstrap
	bin/buildout

bootstrap:
	NIX_PATH=${NIX_PATH} nix-build --out-link nixenv dev.nix -I /home/rok/dev/nixos
	./nixenv/bin/virtualenv --distribute --clear .
	echo ../../../nixenv/lib/python2.7/site-packages > lib/python2.7/site-packages/nixenv.pth
	./bin/easy_install -H "" zc.buildout
	#./bin/easy_install -H "" ipdb
	#./bin/easy_install -H "" ipython

test:
	bin/test

print-syspath:
	./bin/python -c 'import sys,pprint;pprint.pprint(sys.path)'

.PHONY: all bootstrap print-syspath
