# Function Templates

## Ch. 16.2-16.4


---


## Function Templates

- Function templates allow us to practice _generic programming_ in C++.
    + Many algorithms do not depend on the type of data being operated on.
    + Why should we be forced to overload these functions for every new type of data?
   

---


## Function Templates
    
    
- _Function templates_ provide a pattern for a function that can work with many types of data.
- When written, the data type specifiers are replaced with type parameters.
- When called, the compiler generates a function with actual data types that match those provided in the call.
    + The overload still happens, but _the compiler does the work_, not the programmer! 


---


## Example

<!-- .slide: data-state="code-example" -->

``` cpp
template <class NumericType>
NumericType times10(NumericType num){
    return 10 * num;
}
```

- `NumericType` is the _type parameter_ (it can be any valid identifier, but is usually capitalized by convention).
- __Tip:__ Write the function for a normal data type first, then convert to a function template!

<!-- .slide: data-transition="linear", data-state="code-example" -->

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Example 2: Print Array

``` cpp
  
void print_array(const int a[], int size){
    for(int i = 0; i < size; i++){
        cout << a[i] << "\n";
    }
}
```

Start with a known data type: (`int`) array in this case.

<!-- .slide: data-transition="none", data-state="code-example" -->

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Example 2: Print Array


``` cpp
template <class ValueType>
void print_array(const ValueType a[], int size){
    for(int i = 0; i < size; i++){
        cout << a[i] << "\n";
    }
}
```

Here, we have replaced _only the data type(s) that should be generic_ with a template parameter.

- Be careful not to replace data types that _should not be generic_ (like loop counters and sizes)!
- Constraints on data:
    + Must be _stream-insertable_ ( `operator<<` )
    + C++11 - C++17 call these _**concepts**_. <br /><small>  See http://en.cppreference.com/w/cpp/concept</small>

<!-- .slide: data-transition="none", data-state="code-example" -->

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Example 3: Parallel Arrays

``` cpp

void printKeyValuePairs(const string keys[], 
                        const int    values[], 
                        int          size){
    for(int i = 0; i < size; i++){
        cout << keys[i] << ":\t" << values[i] << "\n";
    }
}
```

Again, the function could be more general if `keys` and `values` could be _anything_.

- Notice that the type of `keys` and `values` _should_ be independent of one another.

<!-- .slide: data-transition="none", data-state="code-example" -->

----

<!-- .slide: data-transition="none", data-state="code-example" -->

## Example 3: Parallel Arrays

``` cpp
template <class KeyType, class ValueType>
void printKeyValuePairs(const KeyType   keys[], 
                        const ValueType values[], 
                        int             size){
    for(int i = 0; i < size; i++){
        cout << keys[i] << ":\t" << values[i] << "\n";
    }
}
```

- Use two type parameters (one for each independent type required)
- Constraints on data:
    + Must be _stream-insertable_ ( `operator<<` )




---

## Function Template Notes


- Multiple type parameters can be used.
- Function templates can be overloaded (as long as each overload has a unique signature).
- All type parameters specified in template prefix must be used in the definition.

----

<!-- .slide: data-transition="none", data-state="code-example" -->

### Example 4: Array Library

**`array_utilities.h`**
<small style="font-size: 90%;">

```cpp
#ifndef ARRAY_UTILITIES_H
#define ARRAY_UTILITIES_H

template <class ValueType>
void array_fill(ValueType value, ValueType array[], int size){
    for(int i = 0; i < size; i++){                  // place `value`
        array[i] = value;                           // into each 
    }                                               // element
}

template <class ValueType>
ValueType array_sum(ValueType array[], int size){
    ValueType sum = array[0];                       // don't use 0!
    for(int i = 1; i < size; i++){                  // now sum all
        sum = sum + array[i];                       // remaining 
    }                                               // elements
    return sum;                                     
}
#endif
```

</small>

----

<!-- .slide: data-transition="none", data-state="code-example" -->

**`main.cpp`**

<small style="font-size: 90%;">

```cpp
#include <iostream>
#include "array_utilities.h."

int main(){
    int a[]{ 2, 4, 6, 8, 10 };                      // 5 even values
    
    int sum = array_sum(a, 5);                      // add it up
    std::cout << "Sum:            " << sum << "\n"; // : 30

    array_fill(1, a, 5);                            // fill with 1's
    sum = array_sum(a, 5);                          // re-do sum
    std::cout << "Sum after fill: " << sum << "\n"; // : 5

    return 0;
}
```

</small>

----

<!-- .slide: data-transition="none", data-state="code-example" -->

**`array_utilities.h` - Function Docs Example**
<small style="font-size: 90%;">

```cpp
#ifndef ARRAY_UTILITIES_H
#define ARRAY_UTILITIES_H

/**
 * fill all elements in `array` with the given `value` 
 *
 * @remark     `ValueType`  type must be CopyAssignable.
 *
 * @tparam     ValueType    type of values contained in `array`
 *
 * @param      value        the value to place in all elements
 * @param[out] array        the array to fill
 * @param      size         size of `array`
 */
template <class ValueType>
void array_fill(ValueType value, ValueType array[], int size){
    for(int i = 0; i < size; i++){                  // place `value`
        array[i] = value;                           // into each 
    }                                               // element
}

[...]
```

</small>

