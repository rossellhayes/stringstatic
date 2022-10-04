str_count <- function(string, pattern) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	lengths(
		gregexpr(
			pattern,
			text = string,
			ignore.case = ignore.case,
			perl = !is_fixed,
			fixed = is_fixed
		)
	)
}
