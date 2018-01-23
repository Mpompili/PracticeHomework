class Board
  attr_reader :grid

  def self.default_grid
    # Creates Array within Array, flooding with nil values
    Array.new(10) { Array.new(10, :n) }
  end

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def [](array)
    grid[array[0]][array[1]] if array.is_a?(Array)
  end

  def []=(array, whatever)
    grid[array[0]][array[1]] = whatever
  end

  def count(symbol = :s)
    grid.flatten.count { |element| element == symbol }
  end

  def empty?(ship_key, array = nil)
    if array.is_a?(Array)
      (0...ship_key).all? { |times| grid[array[0]][array[1] + times ] == :n }
    else
      count >= 1 ? (return false) : (return true)
    end
  end

  # def empty?(array = nil)
  #
  #   if array.is_a?(Array)
  #     grid[array[0]][array[1 + times]] == :n
  #   else
  #     count >= 1 ? (return false) : (return true)
  #   end
  # end

  def full?
    count == grid.flatten.count
  end

  def place_random_ship
    raise "It is full" if full?
    random_pos = [rand(@grid.length), rand(@grid.length)]
    self[random_pos] = :s if empty?(random_pos)
  end

  def won?
    @grid.flatten.none? { |element| element == :s }
  end

  def populate_grid(int)
    place_random_ship until count == int
  end

end
