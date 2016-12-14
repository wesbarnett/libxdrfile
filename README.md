# libxdrfile

Fork of [MDAnalysis](https://github.com/MDAnalysis/mdanalysis)'s implementation of
xdrfile, which itself is a fork of [GROMACS](https://www.gromacs.org)'s
implementation.

To install do:

    $ make
    # make install

By default he library is installed to `/usr/local/lib` and headers are installed
to `/usr/local/include`. To choose a specific directory for installation you can
use `PREFIX`. For example, the following installs the library to
`/home/wes/xdrfile`.

    $ make PREFIX=/home/wes/xdrfile install

A pkg-config file is included for use in compiling other programs. You may need
to set `PKG_CONFIG_PATH` to its location (by default `/usr/local/lib/pkgconfig`).

To test the library capabilities, do:

    $ make test
