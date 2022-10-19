str_extract <- function(string, pattern) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)

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
}

str_extract_all <- function(string, pattern) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)

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
}
