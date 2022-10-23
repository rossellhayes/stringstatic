# `R/str_detect.R` is imported from `inst/staticexports/str_detect.R`. 
# Please edit that file instead.

#' Detect the presence or absence of a pattern in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_detect()`.
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
#' @param negate If `TRUE`, return non-matching elements.
#'
#' @return A logical vector.
#' @export
str_detect <- function(string, pattern, negate = FALSE) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)

	indices <- grep(
		pattern,
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed,
		invert = negate
	)

	seq_along(string) %in% indices
}
