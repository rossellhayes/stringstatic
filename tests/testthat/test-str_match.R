test_that("zero-length input", {
	expect_equal(str_match(character(0), character(0)), matrix(character(0)))
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_match(character(0), ""), matrix(character(0)))
})

# These tests are adapted from tests in the stringr package
# https://github.com/tidyverse/stringr
#
# stringr is released under the MIT License
#
# Copyright (c) 2020 stringr authors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# 	The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set.seed(1410)
num <- matrix(sample(9, 10 * 10, replace = T), ncol = 10)
num_flat <- apply(num, 1, str_c, collapse = "")

phones <- str_c(
	"(", num[, 1], num[, 2], num[, 3], ") ",
	num[, 4], num[, 5], num[, 6], " ",
	num[, 7], num[, 8], num[, 9], num[, 10])

# # Not yet implemented
# test_that("empty strings return correct matrix of correct size", {
# 	skip_if_not_installed("stringi", "1.2.2")
#
# 	expect_equal(str_match(NA, "(a)"), matrix(NA_character_, 1, 2))
# 	expect_equal(str_match(character(), "(a)"), matrix(character(), 0, 2))
# })

test_that("no matching cases returns 1 column matrix", {
	res <- str_match(c("a", "b"), ".")

	expect_equal(nrow(res), 2)
	expect_equal(ncol(res), 1)

	expect_equal(res[, 1], c("a", "b"))
})

test_that("single match works when all match", {
	matches <- str_match(phones, "\\(([0-9]{3})\\) ([0-9]{3}) ([0-9]{4})")

	expect_equal(nrow(matches), length(phones))
	expect_equal(ncol(matches), 4)

	expect_equal(matches[, 1], phones)

	matches_flat <- apply(matches[, -1], 1, str_c, collapse = "")
	expect_equal(matches_flat, num_flat)
})

test_that("match returns NA when some inputs don't match", {
	matches <- str_match(c(phones, "blah", NA),
											 "\\(([0-9]{3})\\) ([0-9]{3}) ([0-9]{4})")

	expect_equal(nrow(matches), length(phones) + 2)
	expect_equal(ncol(matches), 4)

	expect_equal(matches[11, ], rep(NA_character_, 4))
	expect_equal(matches[12, ], rep(NA_character_, 4))
})

test_that("match returns NA when optional group doesn't match", {
	expect_equal(str_match(c("ab", "a"), "(a)(b)?")[, 3], c("b", NA))
})

# # Not yet implemented
# test_that("match_all returns NA when option group doesn't match", {
# 	expect_equal(str_match_all("a", "(a)(b)?")[[1]][1, ], c("a", "a", NA))
# })

# # Not yet implemented
# test_that("multiple match works", {
# 	phones_one <- str_c(phones, collapse = " ")
# 	multi_match <- str_match_all(phones_one,
# 															 "\\(([0-9]{3})\\) ([0-9]{3}) ([0-9]{4})")
# 	single_matches <- str_match(phones,
# 															"\\(([0-9]{3})\\) ([0-9]{3}) ([0-9]{4})")
#
# 	expect_equal(multi_match[[1]], single_matches)
# })

# # This doesn't seem necessary
# test_that("match and match_all fail when pattern is not a regex", {
# 	expect_error(str_match(phones, fixed("3")))
# 	expect_error(str_match_all(phones, coll("9")))
# })

test_that("vectorized", {
	expect_equal(
		str_match(c("a", "b"), c("a", "b")),
		matrix(c("a", "b"), ncol = 1)
	)

	expect_equal(
		str_match(c("a", "b"), c("(a)", "(b)")),
		matrix(c("a", "a", "b", "b"), ncol = 2, byrow = TRUE)
	)
})

test_that("edge cases", {
	expect_equal(str_match(NA, "a"), matrix(NA_character_))
	expect_equal(str_match(c(NA, "a"), "a"), matrix(c(NA, "a")))
	expect_equal(str_match(character(0), "a"), matrix(character(0)))
	expect_equal(str_match("a", NA_character_), matrix(NA_character_))
	expect_equal(str_match("a", c(NA, "a")), matrix(c(NA, "a")))
	expect_equal(str_match("a", character(0)), matrix(character(0)))
})

# # This doesn't seem necessary
# test_that("uses tidyverse recycling rules", {
# 	expect_error(
# 		str_match(c("a", "b"), c("a", "b", "c")),
# 		class = "vctrs_error_incompatible_size"
# 	)
# 	expect_error(
# 		str_match_all(c("a", "b"), c("a", "b", "c")),
# 		class = "vctrs_error_incompatible_size"
# 	)
# })

# # This doesn't seem necessary
# test_that("match can't use other modifiers", {
# 	expect_snapshot(error = TRUE, {
# 		str_match("x", coll("y"))
# 		str_match_all("x", coll("y"))
# 	})
# })
