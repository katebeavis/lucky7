class Player

  attr_accessor :name, :money

  def initialize
    @name = name
    @money = 100
  end

  def roll_dice
    dice.roll
  end

  def convert_choice_to_number(input)
    input = downcase_input(input)
    if input == 'less'
      choice = 1
    elsif input == 'greater'
      choice = 8
    elsif input == 'equal'
      choice = 7
    end
    raise choice.inspect
  end

  private

  def downcase_input(input)
    input.downcase
  end
end
