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

  def calculate_new_total(winnings)
    @money += winnings
  end
end
