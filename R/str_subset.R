# `R/str_subset.R` is imported from `inst/staticexports/str_subset.R`. 
# Please edit that file instead.

#' Keep strings matching a pattern
#'
#' Dependency-free drop-in alternative for `stringr::str_subset()`.
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
#' @return A character vector.
#' @export
str_subset <- function(string, pattern, negate = FALSE) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	result <- Map(
		function(string, pattern) {
			grep(
				pattern,
				x = string,
				ignore.case = ignore.case,
				perl = !is_fixed,
				fixed = is_fixed,
				invert = negate
			)
		},
		string, pattern, USE.NAMES = FALSE
	)

	string[which(lengths(result) > 0)]
}

#' Find positions of strings matching a pattern
#'
#' Dependency-free drop-in alternative for `stringr::str_which()`.
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
#' @return An integer vector.
#' @export
str_which <- function(string, pattern, negate = FALSE) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	result <- Map(
		function(string, pattern) {
			grep(
				pattern,
				x = string,
				ignore.case = ignore.case,
				perl = !is_fixed,
				fixed = is_fixed,
				invert = negate
			)
		},
		string, pattern, USE.NAMES = FALSE
	)

	which(lengths(result) > 0)
}
