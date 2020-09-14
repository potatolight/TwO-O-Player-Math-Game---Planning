
class Player 
  attr_accessor :name, :score, :first, :second
  def initialize(name)
    @name = name 
    @score = 3
    @first = rand(20) + 1
    @second = rand(20) + 1

  end

  def dead?
    @score == 0
  end

end