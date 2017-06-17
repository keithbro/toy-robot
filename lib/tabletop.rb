class Tabletop
  attr_reader :max_x
  attr_reader :max_y

  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
  end

  # Returns the direction an entity would be facing if it turned left from the
  # given direction. Throws an exception if the given direction is not a valid
  # one.

  def direction_after_left_turn(direction)
    unless direction_is_valid?(direction)
      raise "Invalid initial direction (#{direction})"
    end

    {
      'NORTH' => 'WEST',
      'WEST'  => 'SOUTH',
      'SOUTH' => 'EAST',
      'EAST'  => 'NORTH',
    }[direction]
  end

  # Returns the direction that an entity would be facing if it turned right from
  # the given direction. Throws an exception if the given direction is not a
  # valid one.

  def direction_after_right_turn(direction)
    unless direction_is_valid?(direction)
      raise "Invalid initial direction (#{direction})"
    end

    {
      'NORTH' => 'EAST',
      'EAST'  => 'SOUTH',
      'SOUTH' => 'WEST',
      'WEST'  => 'NORTH',
    }[direction]
  end

  # Returns an array of coordinates that an entity would be located at, if it
  # moved forward one unit from the given x coordinate, y coordinate and
  # direction in which it is currently facing. If the movement would lead to
  # the entity falling off the table, the current coordinates are returned i.e.
  # no movement.

  def coords_after_move(x, y, direction)
    unless placement_is_valid?(x, y, direction)
      raise "Invalid initial state (#{x}, #{y}, #{direction})"
    end

    new_x = x + ( { 'WEST'  => -1, 'EAST'  => +1 }[direction] || 0 )
    new_y = y + ( { 'SOUTH' => -1, 'NORTH' => +1 }[direction] || 0 )

    coordinates_are_valid?(new_x, new_y) ? [ new_x, new_y ] : [ x, y ]
  end

  # Returns a boolean depending on whether the given coordindates and direction
  # are valid for this tabletop.

  def placement_is_valid?(x, y, direction)
    coordinates_are_valid?(x, y) and direction_is_valid?(direction)
  end

  private
    def coordinates_are_valid?(x, y)
      0 <= x && x <= @max_x && 0 <= y && y <= @max_y
    end

    def direction_is_valid?(direction)
      [ 'NORTH', 'EAST', 'SOUTH', 'WEST' ].include?(direction)
    end
end
