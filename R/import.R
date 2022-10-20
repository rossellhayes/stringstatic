import <- function() {
	files <- dir("inst/staticexports")
	file.copy(file.path("inst/staticexports", files), "R", overwrite = TRUE)
	files <- file.path("R", files)

	lapply(
		files,
		function(file) {
			body <- readLines(file)
			body <- gsub("#' @noRd", "#' @export", body)
			writeLines(body, file)
		}
	)

	files
}
