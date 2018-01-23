# expect(echo("hello")).to eq("hello")
# end
# expect(shout("hello")).to eq("HELLO")
# end
# expect(repeat("hello")).to eq("hello hello")
#
# expect(start_of_word("hello", 1)).to eq("
# expect(first_word("Hello World")).to eq("Hello")
# expect(titleize("jaws")).to eq("Jaws")
# end

def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, i = 2)
  (str * i).chars.each_slice(str.length).to_a.map(&:join).join(' ')
end

def start_of_word(str, int)
  str.chars.take(int).join
end

def first_word(str)
  str.split(' ')[0]
end

def titleize(str)
  lame_words = %w[and the or over]
  str.split.map.with_index do |word, idx|
    if idx.zero? && lame_words.include?(word)
      word.capitalize
    elsif lame_words.include?(word)
      word
    else
      word.capitalize
    end
  end.join(' ')
end
