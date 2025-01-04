
NAME = libgruyere

VERMAJ = 0
VERMIN = 0
VERREV = 1

FULLVER = $(VERMAJ).$(VERMIN).$(VERREV)

SHELL := /bin/bash

BUILDDIR := build
SRCDIR := src
SOURCEFILES := $(shell ls $(SRCDIR)/*/*.cpp)
OBJECTFILES := $(shell ls $(SRCDIR)/*/*.cpp | sed 's/\.cpp/\.o/g' | sed 's/src/$(BUILDDIR)\/objects/g')

PREFIX = usr/local
DESTDIR = /

FLAGS = -fPIC --std=c++20 -g
LINKFLAGS = 

test: all
	(cd test && find . -type d -exec make -C {} \;)

all: static shared

.PHONY: install
install: $(BUILDDIR)/$(NAME).so $(BUILDDIR)/$(NAME).a

	test -f "$(BUILDDIR)/install_manifest.txt" && rm "$(BUILDDIR)/install_manifest.txt" || true

	install -d $(DESTDIR)$(PREFIX)/lib
	install -m 0755 $(BUILDDIR)/$(NAME).a $(DESTDIR)$(PREFIX)/lib/$(NAME).a
	@echo $(DESTDIR)$(PREFIX)/lib/$(NAME).a >> $(BUILDDIR)/install_manifest.txt

	install -m 0755 $(BUILDDIR)/$(NAME).so $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER)
	@echo $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER) >> $(BUILDDIR)/install_manifest.txt
	
	ln -sf $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER) $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(VERMAJ)
	@echo $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(VERMAJ) >> $(BUILDDIR)/install_manifest.txt

	ln -sf $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER) $(DESTDIR)$(PREFIX)/lib/$(NAME).so
	@echo $(DESTDIR)$(PREFIX)/lib/$(NAME).so >> $(BUILDDIR)/install_manifest.txt

	(cd include && find . -type f -exec install -Dm 755 "{}" "/usr/local/include/gruyere/{}" \;)



.PHONY: uninstall
uninstall:
	cat build/install_manifest.txt | xargs echo rm | /usr/bin/sh
	rm -r $(DESTDIR)$(PREFIX)/include/gruyere


.PHONY: clean
clean:
	@printf "Deleting the build directory\n"
	rm -rf $(BUILDDIR)

	rm $(shell find test -type f | grep a.out)

static: $(OBJECTFILES)
	@printf "Linking static library\n"
	ar rcs $(BUILDDIR)/$(NAME).a $^
	@printf "Linked static library\n\n"

shared: $(OBJECTFILES)
	@printf "Linking shared library\n"
	g++ -shared $^ -o $(BUILDDIR)/$(NAME).so
	@printf "Linked shared library\n\n"

objects: $(OBJECTFILES)

# compile the object
# long shell command converts object file path to source file path, $@ is the object file
$(OBJECTFILES): $(SOURCEFILES)
	@printf "Compiling $@\n"
	mkdir -p $(shell dirname "$@")
	test $@ -nt $(shell echo "$@" | sed 's/\.o/\.cpp/g' | sed 's/build\/objects/src/g') || g++ -c $(shell echo "$@" | sed 's/\.o/\.cpp/g' | sed 's/build\/objects/src/g') -o $@ $(FLAGS)
	@printf "Compiled $@\n\n"
