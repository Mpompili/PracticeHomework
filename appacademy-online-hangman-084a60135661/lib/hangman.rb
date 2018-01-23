# require 'pry'

class Hangman
  attr_reader :guesser, :referee, :board, :gleft

  def initialize(options = {})
    default = standard_game
    options = default.merge(options)

    @guesser = options[:guesser]
    @referee = options[:referee]
    @gleft = options[:max]
    binding.pry
  end

  def play
    setup
    take_turn until win
    ending
  end

  def setup
    word_length = referee.pick_secret_word
    guesser.register_secret_length(word_length)
    @board = '_' * word_length
  end

  def take_turn
    display
    letter = guesser.guess(board)
    space = referee.check_guess(letter)
    guesser.handle_response(letter, space)
    update_board(space, letter)
  end

  def display
    system('clear')
    puts "#{gleft} guesses left\n"
    puts "guesses so far #{guesser.guesses}\n\n#{board}"
  end

  def update_board(space, letter)
    if space.empty?
      @gleft -= 1
    else
    space.each { |position| board[position] = letter }
    end
  end

  def standard_game
    {
      guesser: ComputerPlayer.new(File.readlines('dictionary.txt')),
      referee: HumanPlayer.new,
      max: 8
    }
  end

  def win
    board == referee.secret_word || gleft.zero?
  end

  def ending
    if gleft.zero?
      p "you lose...word was #{referee.secret_word}"
    else
      p "you win! #{board} is right"
    end
  end

end

module PlayerMethods
  attr_reader :secret_word, :guesses

  def check_guess(letter)
    raise 'not a letter' unless letter.is_a?(String)
    positions = []
    @secret_word.chars.each_with_index do |ch, idx|
      next unless ch == letter
      positions << idx
    end
    positions
  end

end

class HumanPlayer
  include PlayerMethods

  def initialize
    @guesses = []
  end

  def pick_secret_word
    p 'pick the word you want'
    @secret_word = gets.chomp
    secret_word.length
  end

  def register_secret_length(length)
    length
  end

  def guess(board)
    puts "Guess a letter! (#{board.length} ch long)\n"
    gets.chomp
  end

  def handle_response(string, array)
    # system('clear')
    p "#{string} was found at #{array} positions #{@board}"
    guesses << string
  end

end

class ComputerPlayer
  include PlayerMethods
  attr_reader :dictionary, :alpha, :candidate_words, :secret_word

  def self.player_with_dict_file
    dict = File.readlines('dictionary.txt')
    dict = dict.map(&:chomp)
    ComputerPlayer.new(dict)
  end

  def initialize(dictionary)
    @dictionary = dictionary
    @alpha = ('a'..'z').to_a
    @guesses = []
  end

  def pick_secret_word
    random_word = @dictionary.sample.chomp
    @secret_word = random_word
    random_word.length
  end

  def guess(board)
    best_letter(board)
  end

  def best_letter(board)
    #turn into hash
    combined = candidate_words.join
    alpha.delete_if { |letter| board.include?(letter) }
    z = alpha.reduce { |x, y| combined.count(x) > combined.count(y) ? x : y }
    alpha.delete(z)
  end

  def handle_response(string, array)
    # only updates candidate words
    guesses << string
    candidate_words.keep_if do |word|
      (0...word.length).select { |i| word[i] == string } == array
    end
  end

  def register_secret_length(length)
    @candidate_words = @dictionary.select { |word| word.length == length }
  end

end

if __FILE__ == $PROGRAM_NAME
  print "Guesser: Computer (yes/no)? "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file
  else
    guesser = HumanPlayer.new
  end

  print "Referee: Computer (yes/no)? "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file
  else
    referee = HumanPlayer.new
  end

  Hangman.new({guesser: guesser, referee: referee}).play

end
