test_that("zero-length input", {
	expect_equal(str_c(), character(0))
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

test_that("basic case works", {
	test <- c("a", "b", "c")

	expect_equal(str_c(test), test)
	expect_equal(str_c(test, sep = " "), test)
	expect_equal(str_c(test, collapse = ""), "abc")
})

test_that("obeys tidyverse recycling rules", {
	expect_equal(str_c(), character())

	expect_equal(str_c("x", character()), character())
	expect_equal(str_c("x", NULL), "x")

	# # This doesn't seem necessary
	# expect_snapshot(str_c(c("x", "y"), character()), error = TRUE)
	expect_equal(str_c(c("x", "y"), NULL), c("x", "y"))
})

test_that("vectorised arguments error", {
	expect_error(str_c(letters, sep = c("a", "b")))
	expect_error(str_c(letters, sep = NULL))
	expect_error(str_c(letters, sep = character(0)))
	expect_error(str_c(letters, collapse = c("a", "b")))
	expect_error(str_c(letters, collapse = character(0)))
})

test_that("edge cases", {
	expect_equal(str_c("a", character(0)), character(0))

	expect_equal(str_c(character(0), character(0)), character(0))
	expect_equal(str_c(character(0), character(0), collapse = " "), "")

	expect_equal(str_c(NULL, NULL), character(0))
	expect_equal(str_c(NULL, NULL, collapse = " "), "")
})
