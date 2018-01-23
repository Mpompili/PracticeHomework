class Code
  attr_reader :pegs

  PEGS = {
    'r' => 'Red',
    'g' => 'Green',
    'b' => 'Blue',
    'y' => 'Yellow',
    'o' => 'Orange',
    'p' => 'Purple'
    }

  def self.parse(str)
    new_input = str.chars.map(&:downcase)
    raise 'WRONG' if new_input.any? { |x| !PEGS.include?(x) }
    Code.new(new_input)
  end

  def self.random
    new_code = []
    4.times do
      new_code << PEGS.keys.sample
    end
    Code.new(new_code)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](num)
    return @pegs[num] if num.is_a?(Integer)
  end

  def exact_matches(comp)
    (0..3).count { |num| @pegs[num] == comp.pegs[num] }
  end

  def near_matches(comp)
    other_color_counts = comp.color_counts

    same_matches = 0
    self.color_counts.each do |col_key, num_value|
      next unless other_color_counts.include?(col_key)
      same_matches += [num_value, other_color_counts[col_key]].min
    end
    same_matches - self.exact_matches(comp)
    end

  def ==(comp)
    if comp.is_a?(Code)
      return true if @pegs == comp.pegs
    else
      return false
    end
  end

  def color_counts
    color_counts = Hash.new(0)

    @pegs.each do |color|
      color_counts[color] += 1
    end

    color_counts
  end

end

class Game
  attr_reader :secret_code, :p_code
  attr_writer :rounds
  def initialize(code = Code.random)
  @secret_code = code
  end

  def get_guess
    p "You have #{@rounds} to guess the code!"
      input = gets.chomp
      @p_code = Code.parse(input) #this is getting the right data
  end

  def display_matches(code)
    p "exact: #{code.exact_matches(@secret_code)}"
    p "near: #{code.near_matches(@secret_code)}"
    print "\n"

  end

  def self.intro

    p "You have 10 tries to guess the code...you ready?"
    p "input 'oooo' <- like dis..."
    p "u  can pick r (red) b (blu) y (yel) o (or) p (purp) g (grn)"
    input = gets.chomp
    Game.new.play
  end



  def play
    @rounds = 10
    get_guess

    display_matches(@p_code)
    until @p_code.exact_matches(@secret_code) == 4 || @rounds == 0
      @rounds -= 1
      get_guess
      display_matches(@p_code)
    end
    @rounds == 0 ? (p "you loose") : (p "you win!")
  end

end

Game.intro
