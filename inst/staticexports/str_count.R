#' Count the number of matches in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_count()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param pattern Pattern to look for.
#'
#'   The default interpretation is a regular expression,
#'   as described in [base::regex].
#'   Control options with [regex()].
#'
#'   Match a fixed string (i.e. by comparing only bytes), using [fixed()].
#'   This is fast, but approximate.
#'
#' @return An integer vector.
#' @noRd
str_count <- function(string, pattern = "") {
	is_fixed <- inherits(pattern, "stringr_fixed")
	lengths(gregexpr(pattern, text = string, perl = !is_fixed, fixed = is_fixed))
}
