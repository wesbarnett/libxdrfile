# libxdrfile

Fork of [MDAnalysis](https://github.com/MDAnalysis/mdanalysis)'s implementation of
xdrfile, which itself is a fork of [GROMACS](https://www.gromacs.org)'s
implementation. I forked MDAnalysis' version because they have made several
improvements that were never merged upstream. Additionally I wanted xdrfile to
be a separate package that was easy to link other libraries to.

## Compilation

    $ mkdir build
    $ cd build
    $ cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
    $ make

## Installation

    # make install


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
