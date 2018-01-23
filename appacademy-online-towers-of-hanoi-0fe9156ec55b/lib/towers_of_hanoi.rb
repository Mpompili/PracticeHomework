

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
    @win = @towers[0]
  end

  def move(from, to)
    popped = @towers[from].pop
    @towers[to].push(popped)
  end

  def valid_move?(from, to)
    case
    when from >= 3 || to >= 3 then false
    when @towers[to].empty? then true
    when @towers[from].empty? then false
    when @towers[to].last > @towers[from].last then true
    when @towers[from].last < @towers[to].last then false
    end
  end

  def won?
    @towers[1..-1].any? { |tower| tower == @win }
  end

  def play
    display

    until won?
      p "what tower do you want to move from?"
      from = gets.chomp.to_i
      p "what tower do you want to move to?"
      to = gets.chomp.to_i
      if valid_move?(from, to)
        move(from, to)
        display
      else
        display
        p "Invalid move, do it again!"
      end
    end
    p "you win!"
  end

  def render
    'Tower 0:  ' + @towers[0].join(' ') + "\n" +
    'Tower 1:  ' + @towers[1].join(' ') + "\n" +
    'Tower 2:  ' + @towers[2].join(' ') + "\n"
  end

  def display
    # this moves everything up in the console so that whatever we print
    # afterwards appears at the top
    system('clear')
    puts render
  end

end
