# Abstract Data Types
### Chapter 11


---


## Abstract Data Types

When a built-in data type just isn’t enough...

- Abstract Data Types are user-defined.
- Can represent new "things" from the real world better than built-in types.
- Essentially "extend" the language.
- Three mechanisms for creating ADTs in C++:
    - `enum`
    - `struct`
    - `class`

---


## `enum`

Enumerated Type

- Allows the programmer to specify mnemonic literals.
- Low-level, not very flexible.
- Example:

```cpp
enum WorkDayAbr = {MON, TUE, WED,
                   THR, FRI};

//... later in the program ...

WorkDayAbr today = MON;
```

---

### `enum` (continued)
<small style="font-size: 80%;">

- `enum` values are internally represented by integers.
- `enum` will implicitly cast to `int`, but not vice-versa.
- Limited to creation of custom literals (you cannot really create a complex data type using `enum`).
- C++11 adds some new abilities (search "C++11 enum" online for info)

``` cpp
enum WorkDayAbr = {MON, TUE, WED,
                   THR, FRI};
-----------------------------------------
int rain[5]  = {5, 15, 35, 95, 10};
string names = {"Monday", "Tuesday",
                "Wednesday", "Thursday",
                "Friday"};
for(int i = MON; i <= FRI; i++){
    cout << "Rain chance for "
         << names[i] << ": " << rain[i]
         << endl;
}
```
</small>


---


## Structures

Structures are used to "glue" several other types together to create a new type.

- Structures specify attributes, but (usually) not behaviors.
- The keyword `struct` is used to define a structure:

``` cpp
struct Circle{
    int    x;
    int    y;
    double radius;
};  // Notice the semicolon!
```


---


### Structures (continued)

- The variables declared in a structure definition are called _attributes_ (or sometimes "members").
- You can create a variable (or _instance_) of the new type:

``` cpp
Circle unitCircle;
```

- Then you can access its attributes using "_dot notation_":

``` cpp
unitCircle.x      = 0;
unitCircle.y      = 0;
unitCircle.radius = 1.0;
```

---

### Structures (continued)

- The _member access operator_ (AKA the "dot operator"): &nbsp;&nbsp;&nbsp; **`  .  `**
- You can initialize a structure using something similar to array initializer syntax:

``` cpp
Circle anotherCircle = {3, 2, 2.4}; // old style, deprecated
```

<small style="font-size: 85%;">Or with C++11's **_universal intializer syntax_**:  (**preferred**)</small>

```cpp
Circle yetAnotherCircle{2, 3, 3.8}; // universal, preferred
```

- Notice that the order of items in the list matters!
- You can find out the size of a structure using `sizeof()`:

``` cpp
cout << sizeof(yetAnotherCircle);  // using an instance
// ... or ...
cout << sizeof(Circle);            // using the type
```

---

### Structures (continued)

_**Structures create a new type!**_

No built-in functions or operators will work with the new type by default:

``` cpp
Circle myCircle{1, 2, 3.1};
cout << myCircle << endl;   // Will NOT work!
```

You can define your own functions:

``` cpp
void printCircle(Circle c){
    cout << "("      << c.x
         << ","      << c.y
         << ") r = " << c.radius;
}
```

---

## Structures and Functions

The previous function passed a structure to the `printCircle()` function _by value_.

- Is this a good idea?
- Consider passing by (`const`) reference instead:

``` cpp
void printCircle(const Circle& c){
    cout << "("      << c.x
         << ","      << c.y
         << ") r = " << c.radius;
}
void readCircle(Circle& c){
    cout << "Enter x and y: ";
    cin  >> c.x >> c.y;
    cout << "Enter radius:  ";
    cin  >> c.radius;
}
```

---

## Parallel Arrays VS Structures

- Parallel arrays store related data by common indexing.
- Structures store related data in a single variable...
    - An array of structures can be used in place of parallel arrays.
- When should you choose structures?
    - How closely are the data related?
    - Do the items really "belong" to the same thing?
        - If so, structures would make sense
- Passing a single array VS passing several arrays
    - Ease of use is always a factor!

---

## What About Operators?

(SPOILER ALERT!) You can also overload operators (and other functions) so that they will work with your new type:

``` cpp
std::ostream& operator<< (std::ostream& outstr,
                          const Circle& c)
{
    outstr << "("      << c.x
           << ","      << c.y
           << ") r = " << c.radius;
    return outstr;
}
```

_**More info on operator overloading is coming soon ... or read ahead to Chapter 14, or search online.**_

---

## Assignment

What happens when you _assign_ one structure to another directly?

- The assignment operator ( `=` ) makes a _bit-wise copy_ of the entire structure's contents.
    + "Plain old data" is copied exactly correctly.
    + Arrays are encapsulated in the structure; they get copied as well!
        * Contrast with how arrays are usually treated...
- Pointers can cause trouble!
    + The copy applies to the pointer _only_, not the item being pointed to.
- Resources can cause trouble!
    + Never make a copy of something like an open _stream_.

---

### Example: Two Versions of a Person

``` cpp
// Version 1 uses a C++ array   // Version 2 uses a dynamically-
// as a c-string for name:      // allocated c-string for name:
struct PersonV1{                struct PersonV2{
    int  age;                       int   age;
    char name[30];                  char* name;
};                              };
```

- What is the `sizeof()` each of these structures?
- Are there any logical differences in the interpretation of each?
    + What about implementation differences?

<!-- .slide: data-transition="slide", data-background="aliceblue" -->

---

<!-- .slide: data-transition="slide", data-background="aliceblue" -->

### Example: Two Versions of a Person

``` cpp
// Version 1 uses a C++ array   // Version 2 uses a dynamically-
// as a c-string for name:      // allocated c-string for name:
struct PersonV1{                struct PersonV2{
    int  age;                       int   age;
    char name[30];                  char* name;
};                              };
//-------------------------
IN MAIN: ---------------------------------
PersonV1 p1, p1copy;
PersonV2 p2, p2copy;

p1.age = 10;
strncpy(p1.name, "Adam", 30);

p2.age = 20;
p2.name = new char[30];
strncpy(p2.name, "Alice", 30);
```

---

<!-- .slide: data-transition="slide", data-background="aliceblue" -->

### Example: Two Versions of a Person

``` cpp
struct PersonV1{                struct PersonV2{
    int  age;                       int   age;
    char name[30];                  char* name;
};                              };
//-------------------------
IN MAIN: ---------------------------------
PersonV1 p1, p1copy; // p1 name is "Adam"
PersonV2 p2, p2copy; // p2 name is "Alice"
// [...]
p1copy = p1;
strncpy(p1copy.name, "Billy", 30);

p2copy = p2;
strncpy(p2copy.name, "Beth", 30);

cout << "p1: " << p1.name << " p1copy: " << p1copy.name << endl;
cout << "p2: " << p2.name << " p2copy: " << p2copy.name << endl;
//
// What will print out ???
//
```

<!-- .slide: data-transition="none", data-background="aliceblue" -->

---

<!-- .slide: data-transition="none", data-background="aliceblue" -->

### Example: Two Versions of a Person

``` cpp
struct PersonV1{                struct PersonV2{
    int  age;                       int   age;
    char name[30];                  char* name;
};                              };
//-------------------------
IN MAIN: ---------------------------------
PersonV1 p1, p1copy; // p1 name is "Adam"
PersonV2 p2, p2copy; // p2 name is "Alice"
// [...]
p1copy = p1;
strncpy(p1copy.name, "Billy", 30);

p2copy = p2;
strncpy(p2copy.name, "Beth", 30);

cout << "p1: " << p1.name << " p1copy: " << p1copy.name << endl;
cout << "p2: " << p2.name << " p2copy: " << p2copy.name << endl;
// Prints:   p1: Adam p1copy: Billy
//           p2: Beth p2copy: Beth
// WHAT WENT WRONG ???
```


---


### Two Versions of a Person: Conclusion

- The copy of `p1` to `p1copy` is fine, since the array in `PersonV1` is a statically-sized array.
    + The structure encapuslates the entire array, and bitwise copy is OK.
- The copy of `p2` to `p2copy` was __broken__, since `PersonV2` uses a _pointer_ to a dynamically-allocated c-string array.
    + The _pointer_ was copied, but not the _data_ or the _allocated space_!
        * This is referred to as a _shallow copy_.
        * We really want a _deep copy_ (which allocates more space and makes a true copy of the contents).

---

## Initial Values

C++11 added the ability to include _initialization_ in a structure definition:

```cpp
struct PersonV1 {
    int  age      = 0;    // initialize to 0
    char name[30] = {0};  // "trick" sets elements to '\0'
};
struct PersonV2 {
    int   age  = 0;       // initialize to 0
    char* name = nullptr; // null the pointer
};
```

Here, _assignment initializer syntax_ is used to provide initial values for all members of both structures.

**If you specify initializers, you will not be able to use _universal initializer syntax_ with your new type.**

```cpp
PersonV1 p3{20, "Cassandra"}; // will NOT work
```

+++
### (optional) Initial Values (Universal Syntax)

You can also set initial values using _universal initializer syntax_:

```cpp
struct PersonV1 {
    int  age{0};         // initialize to 0
    char name[30]{0};    // "trick" sets elements to '\0'
};
struct PersonV2 {
    int   age{0};        // initialize to 0
    char* name{nullptr}; // null the pointer
};
```

Here, _universal initializer syntax_ is used to provide initial values for all members of both structures.

**If you specify initializers, you will not be able to use _universal initializer syntax_ with your new type.**

```cpp
PersonV1 p3{20, "Cassandra"}; // will NOT work
```


