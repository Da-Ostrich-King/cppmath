all:
	mkdir -p build/
	g++ src/* -fPIC -shared -o build/libmath.so
	g++ src/* -fPIC -static -o build/libmath.a