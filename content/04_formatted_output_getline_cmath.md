---
title: "04: Formatted Output"
date: 2021-01-13T12:00:00-05:00
draft: false
---

## Formatted Output,<br>`getline()`, `<cmath>`

### CS2114 (Ch. 2, 3)

---

### Formatted Output

The `<iomanip>` library supplies a set of _stream manipulators_ that may be used in conjunction with the stream insertion operator to format output.  
<pre>
Manipulator            Description
-----------------------------------------------------------
std::setw( w )         set the width of the next item in the
                       stream to 'w'
std::setprecision( p ) set number of significant figures in 
                       output to 'p', or set the number of 
                       decimal places to 'p' if used in 
                       conjunction with 'fixed'.
std::fixed             set numeric output to fixed-point 
                       mode (use the number of decimal 
                       places specified by 'setprecision'; 
                       no scientific notation)
std::showpoint         always show the decimal point 
std::left              set alignment to left-aligned
std::right             set alignment to right-aligned
</pre>

---

### Example

``` cpp
double price = 100.0 / 3.0;  // 33.3333333...
std::cout << std::setprecision(2) << std::fixed;
std::cout << "Total price: $" 
          << std::setw(8) << price << "\n";
std::cout << "100 items:   $" 
          << std::setw(8) << 100 * price << "\n";
```
Output:
<pre>
Total price: $   33.33
100 items:   $ 3333.33
</pre>

---

## `getline()`

In order to read a `std::string` that may contain whitespace from an input stream, the `getline()` function should be used:

``` cpp
std::string full_name;

std::cout << "Enter your first and last name: ";
getline(std::cin, full_name);

std::cout << "Hello, " << full_name << "!\n";
```

`getline()` will read an entire line of user input (until the `<ENTER>` key is pressed).  The _syntax_ is: <br />
<tt>getline( <i>source_stream</i> , <i>destination_string</i> )</tt> <br />

<small>Where _`source stream`_ is any input stream and _`destination string`_ is a variable of type `std::string`.</small>

---

### Mixing `getline()` and `>>`

**Problem:** Stream extraction ( `>>` ) leaves the delimiting whitespace in the input stream (usually a `'\n'`).

* `getline()` is _newline-delimited_ by default.  
    - It will appear that the `getline()` was "skipped".  Actually, it saw the `'\n'` and stopped.
* To remove the `'\n'`, use: <br /> _`stream_name`_`.ignore()`
    - Ex:  `std::cin.ignore();`
    - Better:<small style="font-size: 87%;">
 ``` cpp
 std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
 ```
</small>

---

## `cin.get()`

The `cin.get()` function can be used to read a single character, which may be whitespace, from the standard input stream.

**Example**
``` cpp
char ch;
// Reading the <ENTER> key with `>>` alone is difficult... 
// So, use `get()`:
std::cout << "Press <ENTER> to continue...";
std::cin.get(ch); // Will wait for the enter key, then continue.
```

The `get()` function also works with other streams, in general the syntax is: <br />
_`stream`_`.get(`*`character_var`*`)`

---

## Mathematical Functions

There are many mathematical functions that do not have an operator in C++.  The `<cmath>` library provides definitions for these.  Some examples are:

<pre>
Function Name      Description
--------------------------------------------------------
pow(base, exp)     Returns base raised to power of exp
sqrt(x)            Returns square root of x
floor(x)           Returns the mathematical floor of x
ceil(x)            Returns the mathematical ceiling of x
fabs(x)            Returns the absolute value of x
sin(theta)         Returns the mathematical sine of theta
(other trig functions available also; measure in radians)
</pre>

---

### Example

``` cpp
#include <iostream>
#include <cmath>
int main(){
    double a = 3.0;
    double b = 4.0;
    double c = sqrt( pow(a, 2) + pow(b, 2) ); // Pythagorean Theorem
    std::cout << "The hypotenuse is: " << c << ".\n"; 
    return 0;
}
```


