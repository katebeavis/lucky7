require './lib/die'
require './lib/player'
require './lib/bet_position'
require './lib/dealer'
require 'pry'
require 'pry-nav'

class Lucky7
  attr_accessor :dice, :players, :bet_position, :dealer

  def initialize
    @dice = Die.new
    @players = [Player.new, Player.new]
    @bet_position = BetPosition.new
    @dealer = Dealer.new
  end

  def start
    puts 'Welcome to the casino'
    get_name
    turns = 0
    until turns > 9 || sufficient_balance?
      turns += 1
      puts "Turn: #{turns}"
      @players.each do |player|
        choose_bet_position(player)
        place_bet(player)
        puts "You rolled a total of: #{roll_dice}"
        winnings = dealer.calculate_winnings(dice.value, @choice)
        player.calculate_new_total(winnings)
      end
      puts "Total at end of turn #{turns}:"
      @players.each do |player|
        puts "#{player.name}: £#{player.money} \n"
      end
    end
    puts announce_winner
  end

  def get_name
    @players.each do |player|
      puts 'What is your name?'
      name = gets.chomp
      player.name = name
    end
  end

  def choose_bet_position(player)
    puts "#{player.name}, enter your choice - 'Less than 7', 'Greater than 7', or 'Equal'"
    choice = gets.chomp
    while bet_position.position_valid?(choice) == false
      puts "Please enter a valid choice - 'Less than 7', 'Greater than 7', or 'Equal'"
      choice = gets.chomp
    end
    @choice = bet_position.convert_position_to_number(choice)
  end

  def place_bet(player)
    puts "#{player.name} place your bet"
    bet = gets.chomp.to_i
    while player.bet_valid?(bet) == false
      puts "Please enter a valid amount - equal or less than #{player.money}"
      bet = gets.chomp.to_i
    end
    dealer.receive_bet(bet.to_i)
  end

  def roll_dice
    dice.roll
  end

  def sufficient_balance?
    @players.any? { |p| p.money <= 0 }
  end

  def announce_winner
    player1 = @players[0].money
    player2 = @players[1].money
    return "It's a draw!" if player1 == player2
    player1 > player2 ? "#{players[0].name} won!" : "#{players[1].name} won!"
  end

end

lucky7 = Lucky7.new
lucky7.start
