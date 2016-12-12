.PHONY: all install clean test
NAME = libxdrfile
PREFIX ?= /usr
INCLUDE = ${DESTDIR}${PREFIX}/include
LIBDIR = ${DESTDIR}${PREFIX}/lib
PKGCONF = ${LIBDIR}/pkgconfig
LICDIR = ${DESTDIR}${PREFIX}/share/licenses/${NAME}

${NAME}.so: trr_seek.o xdrfile.o xdrfile_trr.o xdrfile_xtc.o xtc_seek.o
	@gcc -o lib/$@ src/*.o -fPIC -shared -Wall

%.o: src/%.c
	@mkdir -p include
	@gcc -c -Iinclude -o src/$@ $< -fPIC -shared -Wall

install: ${NAME}.so
	@install -Dm644 include/* -t ${INCLUDE}
	@install -Dm644 LICENSE  -t ${LICDIR}
	@install -Dm644 lib/pkgconfig/* -t ${PKGCONF}
	@install -Dm755 lib/${NAME}.so -t ${LIBDIR}

test: ${NAME}.so
	@gfortran tests/test.c -o tests/$@ -Iinclude lib/${NAME}.so
	@./tests/test

clean:
	@rm src/*.o lib/*.so
	@rm test.xtc test.trr test.xdr tests/test
	@rmdir lib 
