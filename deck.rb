class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each { |rank| @cards << Card.new(rank, suit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end
end
