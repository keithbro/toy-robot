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
  #
  # COMMENTARY: The tabletop should govern the rules of movement and physics
  # in its world. A robot, for example, cannot decide that if it turns LEFT
  # it should then face SOUTH. This logic should live exclusively in the
  # Tabletop class.
  #
  # COMMENTARY: Note that we have two Hashes here, one for turning LEFT and
  # one for turning RIGHT. Probably, these could have been combined in to a
  # single source of truth (the rules for turning left are the reverse of those
  # for turning right). However in the interests of understandability and
  # readability, and also since this type of data is highly unlikely to change
  # (when you face NORTH and turn left you will be facing WEST, and this fact
  # will still be true in 500 years time), a tradeoff has been made and the
  # truth is duplicated!
  #
  # COMMENTARY: I started off by making the directions constants e.g. NORTH = 1,
  # EAST = 2 etc. This would have worked but as far as I could see I would have
  # needed to maintain a mapping in the CLI class to map the string NORTH to the
  # constant NORTH. There may be a nice way to achieve that but for simplicity
  # I decided to use strings everywhere.

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
    # Note that the lower bound for the tabletop is fixed at 0. This is to
    # meet the requirement of 0,0 being the SOUTH WEST corner.
    def coordinates_are_valid?(x, y)
      0 <= x && x <= @max_x && 0 <= y && y <= @max_y
    end

    def direction_is_valid?(direction)
      [ 'NORTH', 'EAST', 'SOUTH', 'WEST' ].include?(direction)
    end
end
