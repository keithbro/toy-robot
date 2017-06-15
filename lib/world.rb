class World
  def move(robot)
    return unless robot.has_been_placed

    new_x = robot.x + ( { 'WEST'  => -1, 'EAST'  => +1 }[robot.direction] || 0 )
    new_y = robot.y + ( { 'SOUTH' => -1, 'NORTH' => +1 }[robot.direction] || 0 )

    if position_is_valid(new_x, new_y)
      robot.x = new_x
      robot.y = new_y
    end
  end

  def left(robot)
    return unless robot.has_been_placed

    new_direction = {
      'NORTH' => 'WEST', 'WEST' => 'SOUTH', 'SOUTH' => 'EAST', 'EAST' => 'NORTH',
    }[robot.direction]

    robot.direction = new_direction if new_direction
  end

  def right(robot)
    return unless robot.has_been_placed

    new_direction = {
      'NORTH' => 'EAST', 'EAST' => 'SOUTH', 'SOUTH' => 'WEST', 'WEST' => 'NORTH',
    }[robot.direction]

    robot.direction = new_direction if new_direction
  end

  def place(robot, x, y, direction)
    return unless position_is_valid(x, y)
    return unless direction_is_valid(direction)

    robot.direction = direction
    robot.x = x
    robot.y = y
    robot.world = self

    robot
  end

  def report(robot)
    return unless robot.has_been_placed

    [robot.x, robot.y, robot.direction].compact
  end

  private
    def position_is_valid(x, y)
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
