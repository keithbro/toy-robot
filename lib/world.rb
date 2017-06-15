class World
  NORTH = "N"
  EAST  = "E"
  SOUTH = "S"
  WEST  = "W"

  def move(robot)
    new_x = robot.x + ( { WEST  => -1, EAST  => +1 }[robot.direction] || 0 )
    new_y = robot.y + ( { SOUTH => -1, NORTH => +1 }[robot.direction] || 0 )

    if position_is_valid(new_x, new_y)
      robot.x = new_x
      robot.y = new_y
    end
  end

  def left(robot)
    new_direction = {
      NORTH => WEST, WEST => SOUTH, SOUTH => EAST, EAST => NORTH,
    }[robot.direction]

    raise "Invalid robot.direction" unless robot.direction
    robot.direction = new_direction
  end

  def right(robot)
    new_direction = {
      NORTH => EAST, EAST => SOUTH, SOUTH => WEST, WEST => NORTH,
    }[robot.direction]

    raise "Invalid robot.direction" unless robot.direction
    robot.direction = new_direction
  end

  def place(robot, x, y, direction)
    raise "Invalid position (#{x}, #{y})" if not position_is_valid(x, y)

    robot.direction = direction
    robot.x = x
    robot.y = y
    robot.world = self

    robot
  end

  def report(robot)
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
end
