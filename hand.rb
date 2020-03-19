class Hand

  attr_reader :cards
  attr_accessor :bank

  def initialize(params)
    @cards = []
    @bank = 100
  end

  def score
    if (pre_score = cards.map {|card| card.values.join.to_i}.sum) > 21
      @cards.each { |card| pre_score -= 10 if Deck.ace?(card) && pre_score > 21}
    end
    pre_score
  end
end