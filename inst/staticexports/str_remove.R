str_remove <- function(string, pattern) {
	str_replace(string, pattern, replacement = "")
}

str_remove_all <- function(string, pattern) {
	str_replace_all(string, pattern, replacement = "")
}
