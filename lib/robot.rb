class Robot

  # Moves the robot forward one unit in the direction that it is currently
  # facing. If the robot is not on the table or if the move is not allowed then
  # nil is returned, otherwise the moved robot is returned.
  #
  # COMMENTARY: Note that in this method and the following methods it is up to
  # the tabletop class to tell the robot what is the result of the operation.
  # The tabletop is the authority of movement in its world. However the tabletop
  # cannot set the robot's attributes directly, those attributes are still
  # private to the robot, and only the robot can set them.

  def move()
    return unless @tabletop
    @x, @y = @tabletop.coords_after_move(@x, @y, @direction)
    self
  end

  # Turns the robot to the left. Returns nil if the robot has not been placed
  # on the table. Otherwise the turned robot is returned.

  def left()
    return unless @tabletop
    @direction = @tabletop.direction_after_left_turn(@direction)
    self
  end

  # Turns the robot to the right. Returns nil if the robot has not been placed
  # on the table. Otherwise the turned robot is returned.

  def right()
    return unless @tabletop
    @direction = @tabletop.direction_after_right_turn(@direction)
    self
  end

  # Returns an array containing the x coordinate, the y coordinate and the
  # direction of this robot. Returns nil if the robot has not been placed on
  # the table.

  def report()
    @tabletop ? [ @x, @y, @direction ] : nil
  end

  # Given a tabletop, x and y coordinates and a direction, places this robot on
  # the table. Returns nil if the coordinates are not valid or if the direction
  # is not valid. Otherwise, the robot's attributes are set and the placed robot
  # is returned.
  #
  # COMMENTARY: Note that the robot must first check with the tabletop that
  # the placement is a valid one, and only then can it set its attributes.

  def place(tabletop, x, y, direction)
    return unless tabletop.placement_is_valid?(x, y, direction)

    @direction = direction
    @x = x
    @y = y
    @tabletop = tabletop

    self
  end
end
