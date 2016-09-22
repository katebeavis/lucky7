class Player

  attr_accessor :name, :money, :bet

  def initialize
    @name = name
    @money = 100
    @bet = 0
  end

  def convert_choice_to_number(input)
    input = downcase_input(input)
    if input == 'less than 7'
      choice = 1
    elsif input == 'greater than 7'
      choice = 8
    elsif input == 'equal'
      choice = 7
    end
  end

  def calculate_new_total(bet, dice_roll, choice)
    if dice_roll == 7 && choice == 7
      @money += (bet * 6)
    elsif (dice_roll > 7 && choice > 7) || (dice_roll < 7 && choice < 7)
      @money += (bet * 2)
    else
      @money -= bet
    end
  end

  private

  def downcase_input(input)
    input.downcase
  end
end
