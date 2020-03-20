class Table
  attr_reader :dealer, :player
  attr_accessor :deck, :bank

  def initialize(name)
    @deck = Deck.new
    @dealer = DealerHand.new(true)
    @player = PlayerHand.new(name)
    @everybody = [@dealer, @player]
    @deck.shuffle
    @bank = 0
  end

  def initial_deal
    @everybody.each { |person| person.cards << deck.cards.pop << deck.cards.pop }
    @everybody.each { |person| person.bank -= 10 }
    @bank = 20
  end

  def return_cards
    @everybody.each do |person|
      person.cards.size.times { @deck.cards << person.cards.pop }
    end
    @deck.shuffle
  end
end
