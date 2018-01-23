module Player
  attr_reader :name, :blankboard, :board

  SHIPS = {
    0 => 2,
    1 => 3,
    2 => 3,
    3 => 4,
    4 => 5
  }

  def initialize(name)
    @name = name
    @blankboard = Board.new# (10) { Array.new(10, :n) }
    @board = Board.new
  end

  def display(target)
    system('clear')
    puts "\nYou have #{board.count} ships left\nYour Board: "
    dself
    dtarget(target)
  end

  def dself
    board.grid.each { |row| puts "#{row}" }
  end

  def dtarget(target)
    puts "\n#{target.board.count} ships left to sink\nOpponent's board: "
    blankboard.grid.each { |row| puts "#{row}" }
  end

  def set_board(num_ships)
    num_ships.times do |setss|
      dself

      puts "#\n#{name}, set ships \n#{num_ships - setss} left to set"
      puts "#{SHIPS[setss]}x1 size of ship!"
      tester = grab_position(SHIPS[setss])

      SHIPS[setss].times do
        board[tester] = :s
        tester[1] += 1
      end
    end
  end

end

class HumanPlayer
  include Player

  def get_play
    p "#{name}, where do you want to strike? ie: \'int, int\'"
    input = gets.chomp
    [input[0].to_i, input[-1].to_i]
  end

# we need to know what ship and how many spaces we are setting
# we need to be able to change all those pannels

  def grab_position(ship_key)
    pos = gets.chomp
    check = [pos[0].to_i, pos[-1].to_i]
    until board.empty?(ship_key, check)
      puts 'already taken, pick another position: '
      check = grab_position(ship_key)
    end
    check
  end

end

class ComputerPlayer
  include Player
  attr_reader :possible_moves, :reject

  def initialize(name)
    super
    @possible_moves = ((0..9).to_a * 2).permutation(2).to_a.uniq
  end


  def get_play
    #must have hit a ship
    # true false claues
    # if has_leads  # with leads
    #   this
    # else
    pick_empty_spot #
  end

  # def has_leads
  #   @reject.delete_if do |pos|
  #     @blankboard[pos] == :X
  #   end
  # end



  def pick_empty_spot
    deleted = possible_moves.delete(possible_moves.sample)
    @reject << deleted
    deleted
  end

  def grab_position(ship_key)
    pos = [rand(10), rand(10)]
    check = [pos[0].to_i, pos[-1].to_i]
    until board.empty?(ship_key, check)
      puts 'already taken, pick another position: '
      check = grab_position(ship_key)
    end
    check
  end

end
