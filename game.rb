class Game
  attr_accessor :status, :bank, :last_action

  def initialize(table)
    @player = table.player
    @dealer = table.dealer
    @deck = table.deck
    @status = 0
    @table = table
  end

  def player_choice
    puts "What You want to do?"
    options = case status
              when 0
                {1 => :pass, 2 => :take, 3 => :open}
              when 1
                {1 => :open}
              end
    options.each { |num, opt| puts "#{num}. #{opt.capitalize}" }
    choice = gets.chomp.to_i
    options.each { |num, opt| self.send(opt, @player) if num == choice }
  end


  def dealer_choice
    if @dealer.score < 17 && @dealer.cards.size == 2
      take(@dealer)
    else
      pass(@dealer)
    end
  end

  def pass(who)
    return "#{who.type.capitalize} passed."
  end

  def take(who)
    who.cards << @deck.cards.pop
    @status = 1 if ( @player.cards.size == 3 )
  end

  def open(who)
    @status = 1
  end

  def result
    if (@player.score > @dealer.score || @dealer.score > 21) && @player.score <= 21
      puts "You win!"
      @player.bank += @table.bank
      @bank = 0
    elsif (@player.score == @dealer.score) || (@player.score >21 && @dealer.score > 21)
      puts "DRAW!!!"
      @player.bank += (@table.bank/2)
      @dealer.bank += (@table.bank/2)
      @table.bank = 0
    else
      puts "You Lose!!"
      @dealer.bank += @table.bank
      @table.bank = 0
    end
  end
end