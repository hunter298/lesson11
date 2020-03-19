class Deck

  attr_reader :cards

  def initialize
    @cards = []
    ["\u2660", "\u2665", "\u2666", "\u2663"].each do |suit|
      %w(2 3 4 5 6 7 8 9 10).each { |num| @cards << {(num + suit) => num} }
      %w(J Q K).each { |rank| @cards << {(rank + suit) => 10} }
      @cards << {"A#{suit}" => 11}
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def self.ace?(card)
    if card.keys.first =~ /^A/
      true
    end
  end

end