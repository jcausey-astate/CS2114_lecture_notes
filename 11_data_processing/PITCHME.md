# Data Processing
## Featuring: STL Algorithms

---

## Algorithms

STL contains algorithms implemented as function templates.

- Designed to perform operations on containers.
- Requires algorithm header file  `#include <algorithm>`
- Includes:

        accumulate()      max()
        binary_search()   max_element()
        copy()            min()
        count()           min_element()
        fill()            reverse()
        find()            sort()
        is_sorted()       swap()

            ... and many more ...

---

## Algorithms Overview

* Algorithms use _iterators_ for operating on _ranges_ of values in a container.
* Most will take (at least) a "begin" and "end" iterator.

![Range based iterators](assets/images/shared/range_iterators_in_array.png)

---

        accumulate()      max()
        binary_search()   max_element()
        copy()            min()
        count()           min_element()
        fill()            reverse()
        find()            sort()
        is_sorted()       swap()

