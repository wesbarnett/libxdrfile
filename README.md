# libxdrfile

Fork of [MDAnalysis](https://github.com/MDAnalysis/mdanalysis)'s implementation of
xdrfile, which itself is a fork of [GROMACS](https://www.gromacs.org)'s
implementation.

To install do:

    $ mkdir build
    $ cd build
    $ cmake .. 
    $ make
    # make install

By default he library is installed to `/usr/local/lib` and headers are installed
to `/usr/local/include`. To choose a specific directory for installation you can
use `-DCMAKE_INSTALL_PREFIX` with cmake. For example, the following installs the library to
`/home/wes/xdrfile`.

    $ cmake .. -DCMAKE_INSTALL_PREFIX=/home/wes/xdrfile

## Linking other cmake projects

A file is included to easily link other cmake projects to the xdrfile
installation. Use `find_package ( xdrfile )` and the variables
`xdrfile_INCLUDE_DIRS` and `xdrfile_LIBRARIES`.

## pkg-config

A pkg-config file is included for use in compiling other programs. You may need
to set `PKG_CONFIG_PATH` to its location (by default `/usr/local/lib/pkgconfig`).

## Testing

To test the library capabilities, do:

    $ make test
