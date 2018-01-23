class Book
  attr_writer :title
  def title
    lame_words = %w[and the a an in of]
    words = @title.to_s.split
    words.map!.with_index do |word, i|
      if lame_words.include?(word) && !i.zero?
        word
      else
        word.capitalize
      end
    end
    @title = words.join(' ')
  end
end
