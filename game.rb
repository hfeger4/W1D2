require_relative "board.rb"
require_relative "card.rb"
class Game
  attr_accessor :board, :card, :grid

  def initialize
    @guess
    @board = Board.new
    user_turn
  end

  def user_turn
    first = guess
    second = guess
    first.flip
    second.flip
    system("clear")
    self.board.render
    if first.card[0] != second.card[0]
      first.flip
      second.flip
      puts "Your cards were not equal. How good is your memory?"
    elsif self.board.won?
      puts "You have won."
      break
    end
    sleep(3)
    system("clear")
    user_turn
  end

  def guess
    puts "Please enter a guess position: "
    guess_pos = gets.chomp
    if is_valid?(guess_pos)
      guess_pos = guess_pos.split(" ")
      guessed_card = self.board[[guess_pos[0].to_i, guess_pos[1].to_i]]
      if guessed_card.hidden?
        return guessed_card
      end
    end
    puts "That is not a valid choice."
    guess
  end

  def nope
    puts "That is not a valid choice."
    guess
  end

  def is_valid?(pos_guess)
    c_responses = %w(0 1 2 3)
    if pos_guess.length == 3 && pos_guess.split(" ").all? { |char| c_responses.include?(char) }
      return true
    end
    false
  end
end
