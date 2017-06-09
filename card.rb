require_relative "board.rb"
require_relative "game.rb"
class Card
  attr_accessor :card
  attr_accessor :grid
  def initialize(value, hidden = 0)
    @card = [value, hidden]
  end

  def hidden?
    if self.card[1] == 0
      true
    else
      false
    end
  end

  def flip
    if self.card[1] == 0
      self.card[1] = 1
    else
      self.card[1] = 0
    end
  end
end
