class Player

  attr_accessor :name, :money, :bet

  def initialize
    @name = name
    @money = 100
    @bet = 0
  end

  def place_bet(bet)
    @bet = bet
  end

  def bet_valid?(bet)
    bet <= @money
  end

  def calculate_new_total(dice_roll, choice)
    if dice_roll == 7 && choice == 7
      @money += (@bet * 6)
    elsif (dice_roll > 7 && choice > 7) || (dice_roll < 7 && choice < 7)
      @money += (@bet * 2)
    else
      @money -= @bet
    end
  end
end
