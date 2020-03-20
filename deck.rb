class Deck
  attr_reader :cards

  def initialize
    @cards = []
    %i[h d s c].each do |suit|
      %w[2 3 4 5 6 7 8 9 10 J Q K A].each { |rank| @cards << Card.new(rank, suit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end
end
