# `R/regex.R` is imported from `inst/staticexports/regex.R`. 
# Please edit that file instead.

#' Control regex matching behavior
#'
#' Dependency-free drop-in alternative for `stringr::regex()`.
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
regex <- function(
	pattern,
	ignore_case = FALSE,
	multiline = FALSE,
	comments = FALSE,
	dotall = FALSE
	) {
	options <- c(
		if (isTRUE(multiline)) "m",
		if (isTRUE(dotall)) "s",
		if (isTRUE(comments)) "x"
	)

	if (length(options) > 0) {
		pattern <- paste0("(?", paste(options, collapse = ""), ")", pattern)
	}

	structure(
		pattern,
		options = list(
			case_insensitive = ignore_case,
			multiline = multiline,
			comments = comments,
			dotall = dotall
		),
		class = c("regex", "pattern", "character")
	)
}

#' Compare literal bytes in the string
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
fixed <- function(pattern, ignore_case = FALSE) {
	if (isTRUE(ignore_case)) {
		pattern <- paste0("\\Q", pattern, "\\E")
	}

	structure(
		pattern,
		options = list(case_insensitive = ignore_case),
		class = c("fixed", "pattern", "character")
	)
}
