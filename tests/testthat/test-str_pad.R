test_that("zero-length input", {
	expect_equal(str_pad(character(0), 0), character(0))
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

test_that("long strings are unchanged", {
	lengths <- sample(40:100, 10)
	strings <- vapply(lengths, function(x)
		str_c(letters[sample(26, x, replace = T)], collapse = ""),
		character(1))

	padded <- str_pad(strings, width = 30)
	expect_equal(str_length(padded), str_length(strings))
})

test_that("directions work for simple case", {

	pad <- function(direction) str_pad("had", direction, width = 10)

	expect_equal(pad("right"),  "had       ")
	expect_equal(pad("left"),   "       had")
	expect_equal(pad("both"),   "   had    ")
})

test_that("padding based of length works", {
	# \u4e2d is a 2-characters-wide Chinese character
	pad <- function(...) str_pad("\u4e2d", ..., side = "both")

	expect_equal(pad(width = 6),                    "  \u4e2d  ")
	expect_equal(pad(width = 5, use_width = FALSE), "  \u4e2d  ")
})

# # This doesn't seem necessary
# test_that("uses tidyverse recycling rules", {
# 	expect_error(
# 		str_pad(c("a", "b"), 1:3),
# 		class = "vctrs_error_incompatible_size"
# 	)
# 	expect_error(
# 		str_pad(c("a", "b"), 10, pad = c("a", "b", "c"))
# 		class = "vctrs_error_incompatible_size"
# 	)
# })

test_that("vectorized", {
	expect_equal(
		str_pad(c("a", "b"), 1:2),
		c("a", " b")
	)
	expect_equal(
		str_pad(c("a", "b"), 10, pad = c("a", "b")),
		c("aaaaaaaaaa", "bbbbbbbbbb")
	)
})
