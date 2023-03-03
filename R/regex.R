#' Control regex matching behavior
#'
#' Dependency-free drop-in alternative for `stringr::regex()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param pattern Pattern to modify behavior.
#' @param ignore_case Should case differences be ignored in the match?
#' @param multiline
#'   If `TRUE`, `$` and `^` match the beginning and end of each line.
#'   If `FALSE`, the default, only match the start and end of the input.
#' @param comments
#'   If `TRUE`, white space and comments beginning with `#` are ignored.
#'   Escape literal spaces with `\\`.
#' @param dotall If `TRUE`, `.` will also match line terminators.
#'
#' @return An integer vector.
#' @export
#' @staticexport
regex <- function(
	pattern,
	ignore_case = FALSE,
	multiline = FALSE,
	comments = FALSE,
	dotall = FALSE
) {
	options <- paste(
		if (isTRUE(ignore_case)) "i",
		if (isTRUE(multiline)) "m",
		if (isTRUE(dotall)) "s",
		if (isTRUE(comments)) "x",
		sep = ""
	)

	if (nzchar(options)) {
		if (!is.null(names(pattern))) {
			names(pattern) <- paste0("(?", options, ")", names(pattern))
		} else {
			pattern <- paste0("(?", options, ")", pattern)
		}
	}

	structure(pattern, class = c("stringr_regex", "stringr_pattern", "character"))
}

#' Compare literal bytes in the string
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' Dependency-free drop-in alternative for `stringr::fixed()`.
#' This is very fast,
#' but not usually what you want for non-ASCII character sets.
#'
#' @param pattern Pattern to modify behavior.
#' @param ignore_case Should case differences be ignored in the match?
#'
#' @return An integer vector.
#' @export
#' @staticexport
fixed <- function(pattern, ignore_case = FALSE) {
	if (!isTRUE(ignore_case)) {
		return(structure(
			pattern, class = c("stringr_fixed", "stringr_pattern", "character")
		))
	}

	if (!is.null(names(pattern))) {
		names(pattern) <- paste0("(?i)", names(pattern))
	} else {
		pattern <- paste0("(?i)", pattern)
	}

	structure(pattern, class = c("stringr_regex", "stringr_pattern", "character"))
}
