class World
  # Given a robot, moves that robot forward one place in the direction it is
  # facing.
  #
  # If either
  #   * the robot has not been placed in this world or,
  #   * by moving forward the robot would be out of bounds
  #
  # then nil is returned and the robot is not moved. Otherwise the moved robot
  # is returned.

  def move(robot)
    return unless robot.world.eql?(self)

    new_x = robot.x + ( { 'WEST'  => -1, 'EAST'  => +1 }[robot.direction] || 0 )
    new_y = robot.y + ( { 'SOUTH' => -1, 'NORTH' => +1 }[robot.direction] || 0 )

    # Personally, I would prefer to return a message to the user that the
    # coordinates were invalid, but the specification required that any attempt
    # to move the robot out of bounds should be ignored. With that in mind, it
    # is consistent for all invalid moves to be ignored, and that is the
    # approach that I have gone with.
    return unless coordinates_are_valid(new_x, new_y)

    robot.x = new_x
    robot.y = new_y
    robot
  end

  # Given a robot, turns that robot to the left. Returns nil if the robot has
  # not been placed in this world. Otherwise the turned robot is returned.

  def left(robot)
    return unless robot.world.eql?(self)

    robot.direction = {
      'NORTH' => 'WEST', 'WEST' => 'SOUTH', 'SOUTH' => 'EAST', 'EAST' => 'NORTH',
    }[robot.direction]

    robot
  end

  # Given a robot, turns that robot to the right. Returns nil if the robot has
  # not been placed in this world. Otherwise the turned robot is returned.

  def right(robot)
    return unless robot.world.eql?(self)

    robot.direction = {
      'NORTH' => 'EAST', 'EAST' => 'SOUTH', 'SOUTH' => 'WEST', 'WEST' => 'NORTH',
    }[robot.direction]

    robot
  end

  # Given a robot, x and y coordinates and a direction, places the robot in the
  # world. Returns nil if the coordinates are not valid or if the direction
  # is not valid. Otherwise, robot's attributes are set and the placed robot
  # is returned.

  def place(robot, x, y, direction)
    # Again, invalid requests are ignored to be consistent with the requirement
    # that invalid moves are ignored. I would have preferred to give the user
    # some useful feedback in this case.
    return unless coordinates_are_valid(x, y)
    return unless direction_is_valid(direction)

    robot.direction = direction
    robot.x = x
    robot.y = y
    robot.world = self

    robot
  end

  # Given a robot, return an array containing the x coordinate, the y coordinate
  # and the direction. Returns nil if the robot has not been placed in this
  # world.

  def report(robot)
    return unless robot.world.eql?(self)

    [robot.x, robot.y, robot.direction]
  end

  private
    def coordinates_are_valid(x, y)
      max_x = 4
      max_y = 4
      min_x = 0
      min_y = 0

      x <= max_x && y <= max_y && x >= min_x && y >= min_y
    end

    def direction_is_valid(direction)
      [ 'NORTH', 'EAST', 'SOUTH', 'WEST' ].include?(direction)
    end
end
