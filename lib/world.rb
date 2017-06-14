class World
  NORTH = 1
  EAST  = 2
  SOUTH = 3
  WEST  = 4

  def move(robot)
    # validate
    if robot.direction == NORTH
      robot.y = robot.y + 1
    elsif robot.direction == WEST
      robot.x = robot.x - 1
    elsif robot.direction == SOUTH
      robot.y = robot.y - 1
    elsif robot.direction == EAST
      robot.x = robot.x + 1
    else
      raise "Invalid robot.direction"
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
    validate_position(x, y)

    robot.direction = direction
    robot.x = x
    robot.y = y
    robot.world = self
    self
  end

  private
    def validate_position(x, y)
      max_x = 4
      max_y = 4
      min_x = 0
      min_y = 0
      if x > max_x || y > max_y || x < min_x || y < min_y
        raise "Invalid position (#{x}, #{y})"
      end
    end
end
