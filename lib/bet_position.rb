class BetPosition

  def convert_position_to_number(input)
    case input.downcase
    when 'less than 7' 
      position = 1
    when 'greater than 7'
      position = 8
    when 'equal'
      position = 7
    end
  end

  def position_valid?(position)
    ['equal', 'greater than 7', 'less than 7'].include?(position.downcase)
  end
end
