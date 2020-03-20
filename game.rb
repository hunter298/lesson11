class Game
  attr_accessor :status, :bank, :last_action

  def initialize(table)
    @player = table.player
    @dealer = table.dealer
    @deck = table.deck
    @status = 0
    @table = table
  end

  def player_options
    case status
    when 0
      { 1 => :pass, 2 => :take, 3 => :open }
    when 1
      { 1 => :open }
    end
  end

  def player_choice(choice_number)
    player_options.each { |num, opt| send(opt, @player) if num == choice_number }
  end

  def dealer_choice
    if @dealer.score < 17 && @dealer.cards.size == 2
      take(@dealer)
    else
      pass(@dealer)
    end
  end

  def pass(who)
    "#{who.type.capitalize} passed."
  end

  def take(who)
    who.cards << @deck.cards.pop
    @status = 1 if @player.cards.size == 3
  end

  def open(_who)
    @status = 1
  end

  def result
    if (@player.score > @dealer.score || @dealer.busted?) && !@player.busted?
      win(@player)
    elsif (@player.score == @dealer.score) || (@player.busted? && @dealer.busted?)
      spare
    else
      win(@dealer)
    end
  end

  def win(player)
    player.bank += @table.bank
    @table.bank = 0
    "#{player.type.capitalize} wins!"
  end

  def spare
    @player.bank += (@table.bank / 2)
    @dealer.bank += (@table.bank / 2)
    @table.bank = 0
    'Draw!'
  end
end
