printf "Hi, you have opted for the in-built help of this repository.\n"
printf 'If you run the `install.sh` script, without options (i.e., by running `./install.sh`)
it should install Brackets for you. The algorithm it goes through to install Brackets is:

1. If possible it will install Brackets from one of the pre-compiled binaries provided by the
Brackets team. It will prompt you before doing this and ask you if you would prefer to install
Brackets from the available binary or from source code.

2. If a binary package exists for Brackets in an official repository of the distribution being used
it will install Brackets from it.

3. If option 1 or 2 are not possible, or if you opted to install Brackets from source code it will
run the `./lib/build/brackets.sh` script after installing any missing build/runtime dependencies
for Brackets

Note it will NOT install Brackets from unofficial binaries or repositories.'
