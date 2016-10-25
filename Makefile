.PHONY: all install clean test
NAME = libxdrfile
PREFIX ?= /usr
INCLUDE = ${DESTDIR}${PREFIX}/include
LIBDIR = ${DESTDIR}${PREFIX}/lib
LICDIR = ${DESTDIR}${PREFIX}/share/licenses/${NAME}

${NAME}.so: trr_seek.o xdrfile.o xdrfile_trr.o xdrfile_xtc.o xtc_seek.o
	@mkdir -p lib 
	@gcc -o lib/$@ src/*.o -fPIC -shared -Wall

%.o: src/%.c
	@mkdir -p include
	@gcc -c -Iinclude -o src/$@ $< -fPIC -shared -Wall

install: ${NAME}.so
	@install -Dm644 include/* -t ${INCLUDE}
	@install -Dm755 lib/* -t ${LIBDIR}
	@install -Dm644 LICENSE  -t ${LICDIR}

clean:
	@rm src/*.o lib/*.so
	@rmdir lib 
