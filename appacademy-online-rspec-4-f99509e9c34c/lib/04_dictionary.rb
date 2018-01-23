class Dictionary
  def initialize
    @hash = {}
  end

  def entries
    @hash
  end

  def add(option)
    if option.is_a?(Hash)
      @hash[option.keys.first] = option.values.first
    else
      @hash[option] = nil
    end
  end

  def keywords
    @hash.keys.sort
  end

  def include?(key)
    @hash.include?(key)
  end

  def find(key)
    @hash.select { |k, v| k.to_s.include?(key) }
  end

  def printable
    answer = ""
    @hash.sort.each { |k, v| answer << "[" + k + "] \"" + v + "\"\n" }
    answer[0..-2]
  end

end
