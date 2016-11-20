all: program

libbaz.a: src/baz.cpp
	g++ -Iinclude -c src/baz.cpp
	ar rvs libbaz.a baz.o

libqux.a: src/qux.cpp
	g++ -Iinclude -c src/qux.cpp
	ar rvs libqux.a qux.o

program: src/code.cpp libbaz.a libqux.a
	g++ -Iinclude src/code.cpp -L. -lbaz -lqux -o program

clean:
	rm *.o *.a program
