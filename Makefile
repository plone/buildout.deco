#NIX_PATH=nixpkgs=/home/rok/dev/nixos/nixpkgs

all: bootstrap
	bin/buildout

bootstrap:
	nix-build --out-link nixenv dev.nix
	./nixenv/bin/virtualenv --distribute --clear .
	echo ../../../nixenv/lib/python2.7/site-packages > lib/python2.7/site-packages/nixenv.pth
	./bin/easy_install -H "" zc.buildout

print-syspath:
	./bin/python -c 'import sys,pprint;pprint.pprint(sys.path)'

.PHONY: all bootstrap print-syspath
