class Board
  attr_accessor :grid

  def initialize(grid_size = 3)
    if grid_size.is_a?(Array)
      @grid = grid_size
    else
    @grid = Array.new(grid_size ** 2).each_slice(grid_size).to_a
    end

  end

  def place_mark(pos, mark)
    @grid[pos[0]][pos[1]] = mark
  end

  def empty?(array)
    @grid[array[0]][array[1]].nil?
  end

  def winner
    max = (0...@grid.length)
    right_diag = [[0, 0], [1, 1], [2, 2]]
    left_diag = [[0, 2], [1, 1], [2, 0]]
    winning_combos = [right_diag, left_diag]
    # Checks Row Winner
    max.each do |row|
      if @grid[row].all? { |element| element == @grid[row][0] }
        return @grid[row][0]
      end
    end
    # Checks Vertical winner
    max.each do |row|
      if @grid.transpose[row].all? { |element| element == grid.transpose[row][0] && !element.nil?  }
        return @grid.transpose[row][0]
      end
    end
    # Checks Diagnals
    if winning_combos.any? do |combo|
      combo.all? { |items| @grid[items[0]][items[1]] == @grid[1][1] }
    end
      return @grid[1][1]
    end
    # Otherwise, no winner
    nil
  end

  def over?
    # return false if @grid.flatten.all?(&:nil?)
    return false unless winner || @grid.flatten.none?(&:nil?)
    true
  end

  def display

    top = grid[0]
    mid = grid[1]
    bot = grid[2]
    print "\n", top, "\n", mid, "\n", bot
  end
end
