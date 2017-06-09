require_relative "card.rb"
require_relative "game.rb"
class Board
  attr_accessor :grid
  attr_accessor :card

  def initialize
    @grid = Array.new(4) { Array.new(4) { nil } }
    populate
  end

  def [](pos)
    row, col = pos
    @grid [row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    populate_array = (1..8).to_a
    populate_array.concat((1..8).to_a)
    populate_array.shuffle!
    @grid.length.times do |row|
      @grid.length.times do |col|
        self[[row, col]] = Card.new(populate_array.pop)
      end
    end
  end

  def won?
    @grid.each do |row|
      row.each do |el|
        if el.card[1] == 0
          return false
        end
      end
    end
    true
  end

  def render
    fin_str = ""
    @grid.each do |row|
      row.each do |el|
        if el.hidden?
          fin_str << "H "
        else
          fin_str << "#{el.card[0]} "
        end
      end
      fin_str << "\n"
    end
    puts fin_str
  end

end
