class Player

attr_reader :name, :position

def initialize(name)
  @name = name
  @position = 1
end

def take_turn(board)
  dice = Dice.new
  @position += dice.roll
  # test_dice_roll = 100
  # @position += test_dice_roll


  @position = board.snake_or_ladder_position(@position)

  if @position > 100
    @position = 100 - (@position - 100)
  end

end


end





class Dice

  def roll()

    value = 1 + rand(6)
    return value

  end

end


class Board

attr_reader :winning_square, :ladders, :snakes

def initialize
  @winning_square = 100
  @ladders = { 20 => 39 , 48 => 67 , 59 => 62 , 69 => 88 }
  @snakes = { 30 => 8 , 44 => 26 , 86 => 64 }
end

def snake_or_ladder_position(position)

snake_ladder_hash = @ladders.merge(@snakes)

for key in snake_ladder_hash.keys
  if position == key 
    return snake_ladder_hash[position]
  end
end
return position
end




end