test_that("zero-length input", {
	expect_equal(str_count(character(0), character(0)), integer(0))
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_count(character(0), ""), integer(0))
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

test_that("counts are as expected", {
	fruit <- c("apple", "banana", "pear", "pineapple")
	expect_equal(str_count(fruit, "a"), c(1, 3, 1, 1))
	expect_equal(str_count(fruit, "p"), c(2, 0, 1, 3))
	expect_equal(str_count(fruit, "e"), c(1, 0, 1, 2))
	expect_equal(str_count(fruit, c("a", "b", "p", "n")), c(1, 1, 1, 1))
})

# test_that("uses tidyverse recycling rules", {
# 	expect_error(str_count(1:2, 1:3), class = "vctrs_error_incompatible_size")
# })

test_that("can use fixed() and coll()", {
	expect_equal(str_count("x.", fixed(".")), 1)
	# # Not yet implemented
	# expect_equal(str_count("\u0131", turkish_I()), 1)
})

test_that("can count boundaries", {
	# str_count(x, boundary()) == lengths(str_split(x, boundary()))
	expect_equal(str_count("a b c", ""), 5)
	# # Not yet implemented
	# expect_equal(str_count("a b c", boundary("word")), 3)
})
