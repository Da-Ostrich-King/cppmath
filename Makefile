
NAME = libgruyere

BUILDDIR := build
SRCDIR := src
SOURCEFILES := $(shell ls $(SRCDIR)/*/*.cpp)
OBJECTFILES := $(shell ls $(SRCDIR)/*/*.cpp | sed 's/\.cpp/\.o/g' | sed 's/src/$(BUILDDIR)\/objects/g')

test:
	@printf "$(SOURCEFILES)\n$(OBJECTFILES)\n"

all: static shared
	@printf "Building static and shared libraries\n"

clean:
	@printf "Deleting the build directory\n"
	rm -rf $(BUILDDIR)

static: $(OBJECTFILES)
	mkdir -p $(BUILDDIR)/objects
	ar rcs $(NAME).a $^

shared: $(OBJECTFILES)
	mkdir -p $(BUILDDIR)/objects
	g++ -fPIC -shared $(BUILDDIR)/objects/* -o $(BUILDDIR)/$(NAME).so

# compile the object
$(OBJECTFILES): $(SOURCEFILES)
	@printf "Compiling $@\n"
	g++ -c $(shell echo "$@" | sed 's/\.o/\.cpp/g' | sed 's/build\/objects/src/g') -o $@