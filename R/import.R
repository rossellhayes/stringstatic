import <- function() {
	files <- dir("inst/staticexports")
	inst_files <- file.path("inst/staticexports", files)
	r_files <- file.path("R", files)

	Sys.chmod(r_files, mode = "0666")
	file.copy(inst_files, "R", overwrite = TRUE)

	mapply(
		function(r_file, inst_file) {
			header <- c(
				paste0("# `", r_file, "` is imported from `", inst_file, "`. "),
				"# Please edit that file instead.",
				""
			)

			body <- readLines(r_file)
			body <- gsub("#' @noRd", "#' @export", body)
			body <- c(header, body)

			writeLines(body, r_file)
		},
		r_files, inst_files
	)

	Sys.chmod(r_files, mode = "0444")

	files
}
