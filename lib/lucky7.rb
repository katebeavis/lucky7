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
    puts "Enter your choice - 'Less than 7', 'Greater than 7', or 'Equal'"
    choice = gets.chomp
    choice = player1.convert_choice_to_number(choice)
    puts "place your bet"
    bet = gets.chomp
    player1.bet = bet
    puts "#{player1.bet}"
    puts "Output: #{roll_dice}"
  end

  def roll_dice
    dice.roll
  end
end

lucky7 = Lucky7.new
lucky7.start
