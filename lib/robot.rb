require "world"

class Robot
  attr_accessor :direction
  attr_accessor :x
  attr_accessor :y
  attr_writer :world

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
    @world ? [@x, @y, @direction] : nil
  end
end
