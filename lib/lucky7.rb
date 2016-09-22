require './lib/die'
require './lib/player'
require 'pry'
require 'pry-nav'

class Lucky7
  attr_accessor :dice, :player1, :player2, :players

  def initialize
    @dice = Die.new
    @player1 = Player.new
    @player2 = Player.new
  end

  def start
    puts 'Welcome to the casino'
    puts 'What is your name?'
    name = gets.chomp
    player1.name = name
    turns = 0
    until turns > 9 || check_balance?
      turns += 1
      puts "Turn: #{turns}"
      puts "Enter your choice - 'Less than 7', 'Greater than 7', or 'Equal'"
      choice = gets.chomp
      choice = player1.convert_choice_to_number(choice)
      puts "place your bet"
      bet = gets.chomp.to_i
      while player1.bet_valid?(bet) == false
        puts "Please enter a valid amount - equal or less than #{player1.money}"
        bet = gets.chomp.to_i
      end
      player1.place_bet(bet.to_i)
      puts "Output: #{roll_dice}"
      dice_roll = dice.value
      player1.calculate_new_total(dice_roll, choice)
      puts "Total: £#{player1.money} \n"
    end
  end

  def roll_dice
    dice.roll
  end

  def check_balance?
    player1.money <= 0
  end
end

# lucky7 = Lucky7.new
# lucky7.start
