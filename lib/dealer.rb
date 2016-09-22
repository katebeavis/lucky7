class Dealer

  attr_accessor :bet

  def initialize
    @bet = 0
  end

  def receive_bet(bet)
    @bet = bet
  end

  def calculate_winnings(dice_roll, choice)
    if dice_roll == 7 && choice == 7
      winnings = (@bet * 6)
    elsif (dice_roll > 7 && choice > 7) || (dice_roll < 7 && choice < 7)
      winnings = (@bet * 2)
    else
      winnings =- @bet
    end
  end
end
