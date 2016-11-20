project-5
---------

**Intro**

Configure a project with make.

**Guide**

We saw in `project-4` that we had to execute multiple commands in order to compile our program.

Let's consider the following example. We have two libraries, `baz` and `qux`. Now we must compile both libraries and then link those against our program.

```
> cd project-5
> g++ -Iinclude -c src/baz.cpp
> ar rvs libbaz.a baz.o
> g++ -Iinclude -c src/qux.cpp
> ar rvs libqux.a qux.o
> g++ -Iinclude src/code.cpp -L. -lbaz -lqux -o program
> ./program
```

Of course, we don't have to execute all these commands every time. A compilation takes time and we want to avoid any unnecessary actions. If we make changes to `code.cpp`, we only need to compile `code.cpp`. If we make changes to either of the libraries, we have to first compile that library and then compile `code.cpp` which uses the library.

This already creates a complication. Not only we have to execute multiple commands, but we need to have in mind the dependencies between our files so that we execute the right commands each time.

That is where `make` comes in. `make` automates this process. We are only required to configure a file named `Makefile`. Within `Makefile` we specify the commands that need to run and the dependencies between them. Then `make` reads the `Makefile`, looks at the date each file was last modified, and determines which compilations need to be performed.

Given the `Makefile`, we only need to call `make` to get our program.

```
> make
> ./program
```

A `Makefile` is composed of multiple instantiations of the following pattern:

```
target: dependencies
[tab] commands
```

`target` is the output of the set of `commands` specified below. `depencencies` are a list of files and targets this target depends on. If any of the depencencies is not met, `make` will handle that before compiling the current target.

When we run `make`, we see on the console the commands that get executed. Modify `code.cpp` and run `make`. Notice how only `code.cpp` is compiled. Modify `baz.cpp` and run `make`. Notice how both `baz.cpp` and `code.cpp` are compiled.

At last, notice that in the `Makefile` there is a `clean` target. We can execute `make clean` to remove any files produced by the build process. But removing files this way can be dangerous. We should have a way to avoid putting those files in the project directory in the first place.
