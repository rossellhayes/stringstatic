str_extract <- function(string, pattern) {
	fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	regmatches(
		x = string,
		m = regexpr(
			pattern = pattern,
			text = string,
			ignore.case = ignore.case,
			perl = !fixed,
			fixed = fixed
		)
	)
}

str_extract_all <- function(string, pattern) {
	fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	regmatches(
		x = string,
		m = gregexpr(
			pattern = pattern,
			text = string,
			ignore.case = ignore.case,
			perl = !fixed,
			fixed = fixed
		)
	)
}
