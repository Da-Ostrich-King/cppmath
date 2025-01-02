
NAME = libgruyere

VERMAJ = 0
VERMIN = 0
VERREV = 1

FULLVER = $(VERMAJ).$(VERMIN).$(VERREV)

BUILDDIR := build
SRCDIR := src
SOURCEFILES := $(shell ls $(SRCDIR)/*/*.cpp)
OBJECTFILES := $(shell ls $(SRCDIR)/*/*.cpp | sed 's/\.cpp/\.o/g' | sed 's/src/$(BUILDDIR)\/objects/g')

PREFIX = usr/local
DESTDIR = /

FLAGS = -fPIC --std=c++20 -g
LINKFLAGS = 

test:
	@printf "The following is debug information for debugging build errors\n"
	@printf "To build the library, consult the README or just wing it\n\n"
	@printf "Found source files: \n`echo $(SOURCEFILES) | sed 's/ /\n/g'`\n\n"
	@printf "Found object files: \n`echo $(OBJECTFILES) | sed 's/ /\n/g'`\n\n"
	@printf "Commands that will be run during compilation in its current state\nRunning the dry-run\n\n"
	@make all --dry-run

all: static shared

.PHONY: install
install: static shared
	install -d $(DESTDIR)$(PREFIX)/lib
	install -m 0755 $(BUILDDIR)/$(NAME).a $(DESTDIR)$(PREFIX)/lib/$(NAME).a

	install -m 0755 $(BUILDDIR)/$(NAME).so $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER)
	ln -s $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER) $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(VERMAJ)
	ln -s $(DESTDIR)$(PREFIX)/lib/$(NAME).so.$(FULLVER) $(DESTDIR)$(PREFIX)/lib/$(NAME).so

	(cd include && find . -type f -exec install -Dm 755 "{}" "/usr/local/include/gruyere/{}" \;)

.PHONY: uninstall
uninstall:
	rm $(shell find $(DESTDIR)$(PREFIX)/lib/ | grep "$(NAME).so")
	rm $(DESTDIR)$(PREFIX)/lib/$(NAME).a

	rm -r $(DESTDIR)$(PREFIX)/include/gruyere/


clean:
	@printf "Deleting the build directory\n"
	rm -rf $(BUILDDIR)

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
$(OBJECTFILES): $(SOURCEFILES)
	@printf "Compiling $@\n"
	mkdir -p $(shell dirname "$@")
	g++ -c $(shell echo "$@" | sed 's/\.o/\.cpp/g' | sed 's/build\/objects/src/g') -o $@ $(FLAGS)
	@printf "Compiled $@\n\n"
