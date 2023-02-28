test_that("output is always character", {
	expect_equal(str_dup(character(0), 0), character(0))
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

test_that("basic duplication works", {
	expect_equal(str_dup("a", 3), "aaa")
	expect_equal(str_dup("abc", 2), "abcabc")
	expect_equal(str_dup(c("a", "b"), 2), c("aa", "bb"))
	expect_equal(str_dup(c("a", "b"), c(2, 3)), c("aa", "bbb"))
})

test_that("0 duplicates equals empty string", {
	expect_equal(str_dup("a", 0), "")
	expect_equal(str_dup(c("a", "b"), 0), rep("", 2))
})

## This doesn't seem necessary
# test_that("uses tidyverse recycling rules", {
# 	expect_error(str_dup(1:2, 1:3), class = "vctrs_error_incompatible_size")
# })
