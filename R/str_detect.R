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

	grep <- Vectorize(grep, c("pattern", "x"), USE.NAMES = FALSE)

	indices <- grep(
		pattern,
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed,
		invert = negate
	)

	result <- as.logical(lengths(indices))
	result[is.na(string)] <- NA
	result
}

#' Detect the presence or absence of a pattern at the beginning of a string
#'
#' Dependency-free drop-in alternative for `stringr::str_starts()`.
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
str_starts <- function(string, pattern, negate = FALSE) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	grep <- Vectorize(grep, c("pattern", "x"), USE.NAMES = FALSE)

	indices <- grep(
		paste0("^(", pattern, ")"),
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed,
		invert = negate
	)

	result <- as.logical(lengths(indices))
	result[is.na(string)] <- NA
	result
}

#' Detect the presence or absence of a pattern at the end of a string
#'
#' Dependency-free drop-in alternative for `stringr::str_ends()`.
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
str_ends <- function(string, pattern, negate = FALSE) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	grep <- Vectorize(grep, c("pattern", "x"), USE.NAMES = FALSE)

	indices <- grep(
		paste0("(", pattern, ")$"),
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed,
		invert = negate
	)

	result <- as.logical(lengths(indices))
	result[is.na(string)] <- NA
	result
}
