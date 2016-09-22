class Die

  attr_accessor :name, :value

  def initialize
    @name
    @value = 0
  end

  def roll
    @value = 1 + rand(6)
  end
end
