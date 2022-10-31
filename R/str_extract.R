# `R/str_extract.R` is imported from `inst/staticexports/str_extract.R`. 
# Please edit that file instead.

#' Extract matching patterns from a string
#'
#' Dependency-free drop-in alternative for `stringr::str_extract()`.
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
#' @return A character matrix.
#'   The first column is the complete match,
#'   followed by one column for each capture group.
#' @export
str_extract <- function(string, pattern) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	result <- Map(
		function(string, pattern) {
			regmatches(
				x = string,
				m = regexpr(
					pattern = pattern,
					text = string,
					ignore.case = ignore.case,
					perl = !is_fixed,
					fixed = is_fixed
				)
			)
		},
		string, pattern, USE.NAMES = FALSE
	)

	result[lengths(result) == 0] <- NA_character_
	unlist(result)
}

#' Extract matching patterns from a string
#'
#' Dependency-free drop-in alternative for `stringr::str_extract_all()`.
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
#' @param simplify If `FALSE`, the default, returns a list of character vectors.
#'   If `TRUE` returns a character matrix.
#'
#' @return A list of character vectors if `simplify = FALSE`,
#'   or a character matrix if `simplify = TRUE`.
#' @export
str_extract_all <- function(string, pattern, simplify = FALSE) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	result <- mapply(
		function(string, pattern) {
			regmatches(
				x = string,
				m = gregexpr(
					pattern = pattern,
					text = string,
					ignore.case = ignore.case,
					perl = !is_fixed,
					fixed = is_fixed
				)
			)
		},
		string, pattern, USE.NAMES = FALSE
	)

	result[is.na(string)] <- NA_character_

	if (isTRUE(simplify)) {
		max_length <- max(lengths(result))
		result <- lapply(result, function(x) c(x, rep("", max_length - length(x))))
		result <- do.call(rbind, result)
	}

	result
}
