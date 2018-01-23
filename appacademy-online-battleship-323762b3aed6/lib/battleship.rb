require_relative 'player'
require_relative 'board'
require_relative 'battleship'
require 'pry'

class BattleshipGame
  attr_reader :player1, :player2, :player, :target

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player = player2
    @target = player1
  end

  def attack(array, symbol = :X)

    target.board[array] = symbol
    player.blankboard[array] = symbol
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    switch_player
    system('clear')
    player.display(target)
    test_attack(player.get_play)
  end

  def switch_player
    @player, @target = @target, @player
  end

  def test_attack(player_input)
    # binding.pry
      puts "attacked: #{player_input}"
    if target.board[player_input] == :n
      print 'no ships hit'
      attack(player_input, :O)
    elsif target.board[player_input] == :O
      print 'already hit that'
      test_attack(player.get_play)
    else
      print 'hit a ship!'
      attack(player_input)
    end
  end

  def play
    fill_boards
    play_turn until @player.board.won?
    p "#{player.name} wins!"
  end

  def fill_boards
    p 'How many ships should each player have? '
    ships = gets.chomp.to_i
    [player1, player2].each { |players| players.set_board(ships) }
    # [player1, player2].each do |players|
    #   if players.class == ComputerPlayer
    #     players.board.populate_grid(ships)
    #   else
    #     players.set_board(ships)
    #   end
    # end
  end
end



if __FILE__ == $PROGRAM_NAME
  system('clear')

  puts "Welcome to Battleship!\n\nPlayer1 computer? (yes/no): "
  if gets.chomp == 'yes'
    player1 = ComputerPlayer.new('Yessica')
  else
    puts "What\'s your name?"
    player1 = HumanPlayer.new(gets.chomp)
  end

  puts 'Player2 computer? (yes/no): '
  if gets.chomp == 'yes'
    player2 = ComputerPlayer.new('Shezebelle')
  else
    puts "What\'s your name?"
    player2 = HumanPlayer.new(gets.chomp)
  end

  BattleshipGame.new(player1, player2).play
end
