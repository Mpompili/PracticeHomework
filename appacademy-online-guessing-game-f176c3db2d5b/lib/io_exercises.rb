# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def guessing_game
  random = Random.new
  win_num = random.rand(2...100)
  won = false
  num_guesses = 1
  until won
    p 'guess a number'
    input = gets.chomp.to_i
    case
    when input < win_num
      p " #{input} is too low"
      num_guesses += 1
    when input > win_num
      p " #{input} is too high"
      num_guesses += 1
    when input == win_num
      p "You win! #{input} was the correct answer! It took you #{num_guesses} number of tries to win!"
      won = true
    end
  # until won
  #   p 'guess a number'
  #   input = gets.chomp.to_i
  #   if input < win_num
  #     p " #{input} is too low"
  #     num_guesses += 1
  #   elsif input > win_num
  #     p " #{input} is too high"
  #     num_guesses += 1
  #   elsif input == win_num
  #     p "You win! It took you #{num_guesses} number of tries to win!"
  #     won = true
  #   end
  end
end

guessing_game
