project-2
---------

**Intro**

Multiple source files program.

**Guide**

Now we are going to better structure `project-1` by placing the functions in separate files.

We do this by creating a `*.h` and a `*.cpp` file. The `*.h` is called a header file and it contains the function prototypes. The `*.cpp` is the source file and it contains the function implementations.

The header file with the function prototypes is included by `code.cpp`, so that the compiler knows that the functions called in `main` exist and it shouldn't raise an error. Notice, in the header file, the lines starting with the `#` symbol. These represent the include guard. This is used so that the header file in included at most one time within a single source file. Notice, in the `code.cpp` file, the include statement for the `baz` header uses `""`. This tells the compiler to look for the header file starting at the local project directory.

The source file with the function implementations is provided at the compilation step, so that they are compiled and linked with the main program.

Now execute the following. In the `g++` command, we can list the source files in any arbitrary order.

```
> cd project-2
> g++ code.cpp baz.cpp -o program
> ./program
```
