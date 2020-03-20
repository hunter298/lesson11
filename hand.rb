class Hand
  attr_reader :cards
  attr_accessor :bank

  def initialize(_name)
    @cards = []
    @bank = 100
  end

  def score
    if (pre_score = cards.sum(&:value)) > 21
      @cards.each { |card| pre_score -= 10 if card.ace? && pre_score > 21 }
    end
    pre_score
  end

  def busted?
    score > 21
  end
end
