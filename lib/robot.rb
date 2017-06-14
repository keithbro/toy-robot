require "world"

class Robot
  attr_accessor :direction
  attr_accessor :x
  attr_accessor :y
  attr_writer :world

  def move()
    @world.move(self)
  end

  def left()
    @world.left(self)
  end

  def report()
    [@x, @y, @direction]
  end
end
