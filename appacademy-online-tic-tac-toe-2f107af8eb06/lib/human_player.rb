class HumanPlayer
  attr_accessor :name, :mark
  attr_reader :board
  def initialize(name)
    @name = name

  end

  def get_input
    string = gets.chomp.to_s
    [string[0].to_i, string[-1].to_i]
  end

  def get_move
    p 'where'
    next_move = get_input
    until @board.empty?(next_move)
      puts 'taken. stop cheating. pick another'
      next_move = get_input
    end
    next_move
  end

  def display(board)

    @board = board
    top = @board.grid[0]
    mid = @board.grid[1]
    bot = @board.grid[2]
    print "\n", top, "\n", mid, "\n", bot, "\n"
  end

end
