class RPNCalculator
  attr_accessor :arr

  def initialize
    @arr = []
  end

  def push(int)
    @arr << int
  end

  def plus
    raise 'calculator is empty' if @arr.length < 2
    @arr << @arr.pop(2).reduce(:+)
  end

  def minus
    raise 'calculator is empty' if @arr.length < 2
    @arr << @arr.pop(2).reduce(:-)
  end

  def divide
    raise 'calculator is empty' if @arr.length < 2
    @arr << @arr.pop(2).map(&:to_f).reduce(:/)
  end

  def times
    raise 'calculator is empty' if @arr.length < 2
    @arr << @arr.pop(2).reduce(:*)
  end

  def tokens(string)
    ops = %w[* + - /]
    string.split(' ').map { |el| ops.include?(el) ? el.to_sym : el.to_i }
  end

  def evaluate(string)
    @arr = tokens(string)
    answer = []
    arr.each do |el|
      case el
      when Integer
        answer << el
      when :+
        answer << answer.pop(2).reduce(:+)
      when :*
        answer << answer.pop(2).reduce(:*)
      when :-
        answer << answer.pop(2).reduce(:-)
      when :/
        answer << answer.pop(2).map(&:to_f).reduce(:/)
      end
    end
    @arr = answer.last
  end

  def value
    @arr.last
  end
end
