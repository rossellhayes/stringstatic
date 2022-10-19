# stringstatic (development version)

## New functions
* Added `str_count()`
* Added `regex()`

## New arguments
* `str_detect()`, `str_subset()` and `str_which()` gain the `negate` argument.
* `str_extract_all()` gains the `simplify` argument.

## Removals
* All functions have been refactored to no longer rely on `%||%`.
This helps improve the portability of `stringstatic` functions.
As a result, `%||%` has been removed.

# stringstatic 0.0.2

* Added `str_match()`

# stringstatic 0.0.1

* Initial release with the following functions:
  - `str_detect()`
  - `str_extract()`
  - `str_extract_all()`
  - `str_replace()`
  - `str_replace_all()`
  - `str_remove()`
  - `str_remove_all()`
  - `str_subset()`
  - `str_which()`
  - `fixed()`
  - `%||%`
