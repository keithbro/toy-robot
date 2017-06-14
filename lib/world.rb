class World
  NORTH = 1
  EAST  = 2
  SOUTH = 3
  WEST  = 4

  def move(robot)
    x_delta = { WEST => -1, EAST => +1 }[robot.direction] || 0
    y_delta = { NORTH => +1, SOUTH => -1 }[robot.direction] || 0

    new_x = robot.x + x_delta
    new_y = robot.y + y_delta

    if position_is_valid(new_x, new_y)
      robot.x = new_x
      robot.y = new_y
    end
  end

  def left(robot)
    new_direction = {
      NORTH => WEST,
      WEST  => SOUTH,
      SOUTH => EAST,
      EAST  => NORTH,
    }[robot.direction]
    raise "Invalid robot.direction" unless robot.direction
    robot.direction = new_direction
  end

  def place(robot, x, y, direction)
    if !position_is_valid(x, y)
      raise "Invalid position (#{x}, #{y})"
    end

    robot.direction = direction
    robot.x = x
    robot.y = y
    robot.world = self
    self
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
