test_that("zero-length input", {
	expect_equal(str_length(character(0)), integer(0))
	expect_equal(str_width(character(0)), integer(0))
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

test_that("str_length is number of characters", {
	expect_equal(str_length("a"), 1)
	expect_equal(str_length("ab"), 2)
	expect_equal(str_length("abc"), 3)
})

test_that("str_length of missing string is missing", {
	expect_equal(str_length(NA), NA_integer_)
	expect_equal(str_length(c(NA, 1)), c(NA, 1))
	expect_equal(str_length("NA"), 2)
})

test_that("str_length of factor is length of level", {
	expect_equal(str_length(factor("a")), 1)
	expect_equal(str_length(factor("ab")), 2)
	expect_equal(str_length(factor("abc")), 3)
})

test_that("str_width returns display width", {
	# Results for non-ASCII characters may be inaccurate in R < 4.0
	skip_if(getRversion() < 4.0)
	x <- c("\u0308", "x", "\U0001f60a")
	expect_equal(str_width(x), c(0, 1, 2))
})
