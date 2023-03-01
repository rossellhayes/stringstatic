test_that("zero-length input", {
	expect_equal(str_remove(character(0), character(0)), character(0))
	expect_equal(str_remove_all(character(0), character(0)), character(0))
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_remove(character(0), ""), character(0))
	expect_equal(str_remove_all(character(0), ""), character(0))
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

test_that("succesfully wraps str_replace_all", {
	expect_equal(str_remove_all("abababa", "ba"), "a")
	expect_equal(str_remove("abababa", "ba"), "ababa")
})

test_that("vectorized", {
	expect_equal(
		str_remove_all(c("abababa", "acacaca"), c("ba", "ca")),
		c("a", "a")
	)
	expect_equal(
		str_remove(c("abababa", "acacaca"), c("ba", "ca")),
		c("ababa", "acaca")
	)
})
