# Structured<br />Programming<br />Basics

## CS2114 (Ch. 1, 2)


---

## First Principles

* _computer_ - a programmable machine designed to follow instructions
    - Computers are able to perform mathematical and logical operations at great speed.
* _algorithm_ - a precise, step-by-step plan for solving a problem
* _program_ - a set of instructions expressed in a _programming language_ that a computer follows to perform a task
* _programmer_ - a person who writes a computer program
* _programming language_ - any language designed specifically for use in creating computer programs

---

### A computer is simply a re-configurable mechanical tool. 

Programmers use programs to direct the behavior of the machine.  

So, a computer is the ultimate "Swiss Army Knife".

---

## Computer Code

Computers execute code that is stored in _computer memory_ in a _binary_ form.

    11000111 01000100 00100100 00000100 00011000 10000111 00000100

Humans are not skilled at writing in machine language.

![Confused Human](/images/SP_Basics/confused_brad.jpg) <!-- .element: class="fragment" data-fragment-index="1" -->

---

## Language Levels

* Low-Level 
    - Machine Language
        + Pure binary, but usually expressed as hexadecimal
    - Assembly Language
        + Corresponds more or less 1:1 with machine language (easy conversion)
        + More human-readable (for some definition of _more_)
* High-Level
    - C, C++, Python, Java, etc.
        + Designed to look like a human language
        + Must be translated to machine language

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Machine Language (Binary)

```
01010101                                                      
10001001 11100101                                             
10000011 11100100 11110000                                    
10000011 11101100 00010000                                    
11000111 01000100 00100100 00000100 00011000 10000111 00000100
00001000                                                      
11000111 00000100 00100100 00100000 10100000 00000100 00001000
11101000 11100011 11111110 11111111 11111111                  
10111000 00000000 00000000 00000000 00000000                  
11001001                                                      
11000011                                                                  
```


----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Machine Language (Hexadecimal)

```
55                              
89 e5                  
83 e4 f0               
83 ec 10               
c7 44 24 04 18 87 04 08
c7 04 24 20 a0 04 08   
e8 e3 fe ff ff         
b8 00 00 00 00         
c9                     
c3        
```


----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Assembly Language (Intel)

```
<main>:
push   %ebp
mov    %esp,%ebp
and    $0xfffffff0,%esp
sub    $0x10,%esp
movl   $0x8048718,0x4(%esp)
movl   $0x804a020,(%esp)
call   0x8048500 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
mov    $0x0,%eax
leave  
ret    
```

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## High Level (C++)

``` cpp
int main(){
    std::cout << "Hello, World\n";
    return 0;
}
```

![Happy Human](/images/SP_Basics/Happy.jpg) <!-- .element: class="fragment" data-fragment-index="1" -->

---

## A Complete C++ Program:

``` cpp
#include <iostream>

int main(){
    std::cout << "Hello, World!\n";
    return 0;
}

```

Now, we will take a look at the parts of the program, and see what each part does.

---

## Program Parts

``` cpp
#include <iostream>
```

* This line is called a _preprocessor directive_.  
* It communicates with a phase of the C++ compiler called the _preprocessor_, telling it to include code from a file named _"iostream"_, which is a C++ library.  
* The _iostream_ library contains code that is used for input and output activities.


----


## Program Parts

``` cpp
int main()
```

* This line is called a _function header_.
* It begins the definition of a function called "main".
* Every C++ program *must* contain a `main()` function.
    - The `main()` function tells the computer where to begin executing.
    - Instructions will be executed one at a time, starting with the first line of `main`.


----


## Program Parts

```cpp
{

}
```

* The _curly braces_ enclose a _block_ of code in C++.
* __block__ - a set of related C++ statements that perform an action
* Every opening curly brace must match with a closing brace.  
    - We indent the code between the `{` and the `}`.


----

## Program Parts

``` cpp
    std::cout << "Hello, World\n";
```

* This _statement_ sends the words "Hello, World" to the screen.
* `std::cout` is the name of the _standard output_ _stream_
    - A _stream_ is a one-way flow of data from the point of view of the program.
* `<<` is the _stream insertion operator_, used to place things into a stream.
* `"Hello, World!\n"` is a _string literal_; a _string_ is just a collection of characters that are treated as a single unit.
    - String literals are always surrounded by double-quotes.

----

## Escape Characters

``` cpp
    std::cout << "Hello, World\n";
```

<small>We often want to include _control characters_ in our string literals, but we don't have the ability to type these in directly.  C++ allows the use of _escape characters_ for this purpose.</small>

* __escape character__ - any character combination beginning with "`\`", used to represent a character that cannot otherwise be represented in a string literal.

__Examples:__

    Code     Meaning
    ------------------
     \n      newline (think of the <ENTER> key)
     \t      tab character
     \"      allows a double-quote in a string literal
     \\      allows a backslash in a string literal
     \r      carriage-return (used in Windows line endings: "\r\n")

----

## Program Parts

``` cpp
    return 0;
```

* This line terminates the program by causing the `main()` function to return the value `0` to the operating system.
    - No code following this line would ever be executed; this means that the `return 0;` line will always be the last line in `main()`.
* The operating system considers zero to be an indication that the program ran normally.  
    -  Other values are possible, and we will use them later.

---

__Terms from Program Parts__

* _preprocessor_ : compiler component that works on the source code itself.  Directives start with `#` symbol.
* _library_ or _header_ : a file containing C++ code that adds functionality to your program.
* _statement_ : a single logical step expressed in C++ (usually one line)  _Ends with a semicolon!__
* _stream_ : one-way flow of data in a program
* _literal_ : a data value that is hard-coded in a program
* _string_ : a collection of characters treated as a single data value
* _block_ : a collection of related statements surrounded by curly braces

---

## Our Development Toolchain

![Our Development Toolchain](/images/SP_Basics/Our_Compiling_Toolchain.png) 

* User's Side: Editing, running and testing.
* Server Side: Stores files, provides compiler and other tools.

---

## Practice Developing and Compiling

``` cpp
#include <iostream>

int main(){
    std::cout << "Hello, World!\n";
    return 0;
}

```

Make modifications to the program so that it will print out your name, favorite food, and favorite TV series.