str_match <- function(string, pattern) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	matches <- regmatches(
		x = string,
		m = regexec(
			pattern = pattern,
			text = string,
			ignore.case = ignore.case,
			perl = !is_fixed,
			fixed = is_fixed
		)
	)

	matrix(
		unlist(matches, use.names = FALSE),
		nrow = length(matches),
		byrow = TRUE
	)
}
