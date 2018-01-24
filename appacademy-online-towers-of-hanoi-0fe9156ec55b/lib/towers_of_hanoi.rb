class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(from, to)
    towers[to].push(towers[from].pop)
  end

  def valid_move?(from, to)
    if towers[from].empty?
      return false
    elsif !towers[to].empty? && towers[from].last > towers[to].last
      return false
    end
    true
  end

  def won?
    win = [3, 2, 1]
    towers[1] == win || towers[2] == win
  end

  def take_turn
    display
    puts "\tpick your move.."
    input = grab_input
    move(input[0], input[1]) if valid_move?(input[0], input[1])
  end

  def grab_input
    input = gets.chomp
    [input[0].to_i, input[-1].to_i]
  end

  def finish
    display
    puts "\n" + '==='*12 + "\n"
    puts "\tCongratulations for winning!"
  end

  def play
    take_turn until won?
    finish
  end

  def display
    system('clear')
    puts '===' * 12 + "\n\n"
    display_t(towers.map(&:reverse))
  end

  def display_t ntower
    puts "\t[ #{ntower[0][-3]} ]\t[ #{ntower[1][-3]} ]\t[ #{ntower[2][-3]} ]"
    puts "\t[ #{ntower[0][-2]} ]\t[ #{ntower[1][-2]} ]\t[ #{ntower[2][-2]} ]"
    puts "\t[ #{ntower[0][-1]} ]\t[ #{ntower[1][-1]} ]\t[ #{ntower[2][-1]} ]"
    puts "\n" + '===' * 12
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Ready for Towers of Hanoi? (y/n)'
  TowersOfHanoi.new.play unless gets.chomp == 'n'
  puts "\n\tThank you for playing!\n\n"
end
