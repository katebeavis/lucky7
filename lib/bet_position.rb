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
    position.downcase == ('less than 7' && 'greater than 7' && 'equal')
  end
end
