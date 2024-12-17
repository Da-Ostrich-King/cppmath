
NAME = libgruyere

BUILDDIR = build
SRCDIR = src


all:
	@printf "Building static and shared libraries\n"
	make static
	make shared

clean:
	@printf "Deleting the build directory\n"
	rm -rf $(BUILDDIR)

static: Bigint.o
	mkdir -p $(BUILDDIR)/objects
	ar rcs $(NAME).a $^

shared: Bigint.o
	mkdir -p $(BUILDDIR)/objects
	g++ -fPIC -shared $(BUILDDIR)/objects/* -o $(BUILDDIR)/$(NAME).so


Bigint.o: $(SRCDIR)/Bigint.cpp
	@printf "Compiling $@\n"
	g++ -c $< -o $(BUILDDIR)/$@