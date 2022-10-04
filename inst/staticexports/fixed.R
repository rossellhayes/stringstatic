fixed <- function(pattern, ignore_case = FALSE) {
	structure(
		pattern,
		options = list(case_insensitive = ignore_case),
		class = c("fixed", "pattern", "character")
	)
}

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
