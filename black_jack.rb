require_relative 'table'
require_relative 'deck'
require_relative 'game'
require_relative 'hand'
require_relative 'dealer_hand'
require_relative 'player_hand'

puts 'Welcome to oue Casino!!'
puts 'Enter your name:'
name = gets.chomp.capitalize
table = Table.new(name)

def play table
  table.initial_deal
  game = Game.new(table)
  loop do
    case game.status
    when 0
      puts '------------------------------------------------------'
      table.show_close
      game.player_choice
      game.dealer_choice
    when 1
      puts '------------------------------------------------------'
      puts "Game over!"
      table.show_open
      game.result
      puts "\nDealer's bank: #{table.dealer.bank}"
      puts "Your bank: #{table.player.bank}"
      puts "#{table.player.name}, would You like to play more? y/n"
      input = gets.chomp
      if input == 'y'
        table.return_cards
        play table
      else
        break
      end
    end
  end
end

play table
