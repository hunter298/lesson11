require_relative 'table'
require_relative 'deck'
require_relative 'game'
require_relative 'hand'
require_relative 'dealer_hand'
require_relative 'player_hand'
require_relative 'card'

class BlackJack
  def initialize
    puts 'Welcome to our Casino!!'
    @name = player_input("What's Your name, player?")
    @table = Table.new(@name)
  end

  def play
    @table.initial_deal
    game = Game.new(@table)
    loop do
      case game.status
      when 0
        puts '----------------------'
        show_close
        game.player_options.each { |num, opt| puts "#{num}. #{opt}" }
        game.player_choice(player_input.to_i)
        game.dealer_choice
      when 1
        puts '----------------------'
        puts 'Game over!'
        show_open
        puts game.result
        puts "\nDealer's bank: #{@table.dealer.bank}"
        puts "Your bank: #{@table.player.bank}"
        abort unless player_input('Wanna play more? (y/n)') == 'y'
        @table.return_cards
        play
      end
    end
  end

  def player_input(text = '')
    puts text
    gets.chomp
  end

  def show_close
    cards_on_table(@table.dealer, false)
    puts "\nDealer's money: #{@table.dealer.bank}$"
    cards_on_table(@table.player, true)
    puts "Player's money: #{@table.player.bank}$"
    puts "Bank: #{@table.bank}$"
  end

  def show_open
    cards_on_table(@table.dealer, true)
    cards_on_table(@table.player, true)
  end

  def cards_on_table(player, open)
    puts "#{player.type.capitalize}'s hand:"
    open ? player.cards.each { |card| print "#{card}  " } : player.cards.each { |_card| print "\u25A9  " }
    puts "\n#{player.type.capitalize}'s score: #{player.score}" if open
  end
end

BlackJack.new.play
