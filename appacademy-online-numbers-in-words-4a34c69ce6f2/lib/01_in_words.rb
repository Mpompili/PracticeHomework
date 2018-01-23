class Fixnum
  ONES = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine'
  }

  TEENS = {
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  TENS = {
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  MAGNITUDE = {
    100 => 'hundred',
    1000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion',
    1_000_000_000_000 => 'trillion'
  }

  def num_digits
    Math.log10(self).to_i + 1
  end

  def in_words
    if self < 10
      ONES[self]
    elsif self < 20
      TEENS[self]
    elsif self < 100 && self >= 20
      if (self % 10).zero?
        TENS[self]
      else
        tens_num = (self / 10) * 10
        "#{tens_num.in_words} #{(self % 10).in_words}"
      end
    else
      magnitude = find_magnitude
      magnitude_words = (self / magnitude).in_words + ' ' + MAGNITUDE[magnitude]
      if (self % magnitude).zero?
        magnitude_words
      else
        magnitude_words + " " + (self % magnitude).in_words
      end
    end
  end

  def find_magnitude
    MAGNITUDE.keys.take_while { |magnitude| magnitude <= self }.last
  end
end
