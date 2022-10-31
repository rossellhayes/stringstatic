#' Extract matched groups from a string
#'
#' Dependency-free drop-in alternative for `stringr::str_match()`.
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
#' @return A character matrix.
#'   The first column is the complete match,
#'   followed by one column for each capture group.
#' @noRd
str_match <- function(string, pattern) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	matches <- mapply(
		function(string, pattern) {
			regmatches(
				x = string,
				m = regexec(
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

	length <- max(lengths(matches))
	matches <- lapply(matches, `[`, seq_len(length))

	result <- do.call(rbind, matches)
	result[result == ""] <- NA_character_
	result
}
