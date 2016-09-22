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
    puts "#{player1.name}: #{player1.money}"
    puts "Enter your choice"
    input = gets.chomp
    puts player1.convert_choice_to_number(input)
  end

  def roll_dice
    dice.roll
  end
end

lucky7 = Lucky7.new
lucky7.start
