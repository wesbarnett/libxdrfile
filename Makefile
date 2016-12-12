.PHONY: all install clean test
NAME = libxdrfile
PREFIX ?= /usr
INCLUDE = ${DESTDIR}${PREFIX}/include
LIBDIR = ${DESTDIR}${PREFIX}/lib
PKGCONF = ${LIBDIR}/pkgconfig
LICDIR = ${DESTDIR}${PREFIX}/share/licenses/${NAME}

SOURCES := $(wildcard src/*.c)
HEADERS := $(wildcard include*.h)
OBJECTS := $(SOURCES:src/%.c=%.o)
CFLAGS := -fPIC -shared -Wall

${NAME}.so: ${OBJECTS}
	@gcc -o lib/$@ src/*.o ${CFLAGS}

%.o: src/%.c
	@mkdir -p include
	@gcc -c -Iinclude -o src/$@ $< ${CFLAGS}

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
