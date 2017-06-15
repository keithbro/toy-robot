class Robot
  attr_accessor :direction
  attr_accessor :x
  attr_accessor :y
  attr_accessor :world

  # These methods serve as convenience methods which proxy to the world that
  # the robot is in for their logic. The idea of this is that the world is
  # the authority on whether the robot can move, turn or be placed and
  # ultimately it is up to the world to either allow or deny that.

  def move()
    @world ? @world.move(self) : nil
  end

  def left()
    @world ? @world.left(self) : nil
  end

  def right()
    @world ? @world.right(self) : nil
  end

  def report()
    @world ? @world.report(self) : nil
  end
end
