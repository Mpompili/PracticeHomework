class ComputerPlayer
  attr_reader :board, :name
  attr_accessor :mark
  def initialize(name)
    @name = name

  end

  def get_move
    possible_pos = [0, 0, 1, 1, 2, 2].permutation(2).to_a.uniq
    possible_pos.each do |combo|
      tester = Board.new(@board.grid)
      old_mark = tester.grid[combo[0]][combo[1]]
      tester.place_mark(combo, @mark)
      if tester.winner
        return combo
      else
        tester.place_mark(combo, old_mark)
      end
    end
    possible = possible_pos.select do |combo|
      @board.empty?(combo)
    end
    return possible.sample
  end

  def display(board)
    @board = board

  end

end
