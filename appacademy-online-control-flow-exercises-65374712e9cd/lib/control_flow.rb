# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.chars.map { |ch| ch == ch.downcase ? '' : ch }.join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  start = str.length / 2
  str.length.odd? ? str[start] : str[start - 1..start]
end

# Return the number of vowels in a string.

def num_vowels(str)
  vowels = "aeiou"
  str.chars.count { |ch| vowels.include?(ch.downcase) }
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  (1..num).reduce(:*)
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  # combines elements in array with optional separator
  arr * separator
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.chars.map.with_index { |ch, idx| idx.even? ? ch.downcase : ch.upcase }.join
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  str.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  (1..n).map do |num|
    num = 'fizzbuzz' if num % 3 == 0  && num % 5 == 0
    num = 'fizz' if num % 3 == 0
    num = 'buzz' if num % 5 == 0
    num
  end
end
# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num <= 1
  (2...num).any? { |number| return false if (num % number).zero? }
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  (1..num).select { |number| (num % number).zero? }
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  factors(num).select { |number| prime?(number) }
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).count
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  # go through array and see if any of the elements in the array have a total count  of converts
  arr.partition(&:even?).min_by(&:length)[0]
  # arr.partition { |el| el.even? }.min_by { |x| x.length }[0]
end
