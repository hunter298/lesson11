class Table
  attr_reader :dealer, :player
  attr_accessor :deck,:bank

  def initialize(name)
    @deck = Deck.new
    @dealer = DealerHand.new(true)
    @player = PlayerHand.new(name: name)
    @everybody = [@dealer, @player]
    @deck.shuffle
    @bank = 0
  end

  def initial_deal
    @everybody.each { |person| person.cards << deck.cards.pop << deck.cards.pop}
    @everybody.each { |person| person.bank -= 10 }
    @bank = 20
  end

  def show_close
    puts 'Dealer hand:'
    dealer.cards.each { |card| print "\u25A9  " }
    puts "\nDealer's money: #{@dealer.bank}$"
    puts "\nYour hand:"
    player.cards.map {|card| card.keys.join}.each { |card| print "#{card}  " }
    puts "\nYour score: #{@player.score}"
    puts "Your money: #{@player.bank}$"
    puts "Bank: #{@bank}$"
  end

  def show_open
    puts 'Dealer hand:'
    dealer.cards.map {|card| card.keys.join}.each { |card| print "#{card}  " }
    puts "\nDealer score: #{@dealer.score}\n"
    puts 'Your hand:'
    player.cards.map {|card| card.keys.join}.each { |card| print "#{card}  " }
    puts "\nYour score: #{@player.score}"
  end

  def return_cards
    @everybody.each do |person|
      person.cards.size.times { @deck.cards << person.cards.pop }
    end
    @deck.shuffle
  end

end