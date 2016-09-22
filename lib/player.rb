class Player

  attr_accessor :name, :money

  def initialize
    @name = name
    @money = 100
  end

  def bet_valid?(bet)
    bet <= @money
  end

  def calculate_new_total(winnings)
    @money += winnings
  end
end
