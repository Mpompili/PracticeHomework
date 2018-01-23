  require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :move, :current_player, :waiting
  # sets two players & marks, creates a new board
  def initialize(player_one, player_two)
    @board = Board.new
    @current_player = player_one
    player_one.mark = :X
    player_two.mark = :O
    @waiting = player_two
  end

  def switch_players!
    @current_player, @waiting = @waiting, @current_player
  end

  def play
    # until no more moves can be done on the board
    until @board.over?
      @current_player.display(@board)
      # @waiting.display(@board) # for second player to recieve?
      play_turn
    end
    p "#{@board.display}...#{@waiting.name} wins!"
  end

  # applies current players chosen move and places mark at spot
  def play_turn
    @board.place_mark(@current_player.get_move, @current_player.mark)
    switch_players!
  end
end

#starting game from the console
def start_game
  p "What's your name, player one?"
  input = gets.chomp.to_s
  me = HumanPlayer.new(input)
  comp = ComputerPlayer.new('Jessica')
  new_game = Game.new(me, comp)
  new_game.play
end

start_game
