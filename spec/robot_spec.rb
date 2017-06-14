require "robot"
require "world"

describe Robot do
  world = World.new()
  robot = Robot.new()

  it "can report its status" do
    world.place(robot, 1, 2, World::SOUTH)
    expect(robot.report()).to eql([1, 2, World::SOUTH])
  end

  it "can move" do
    world.place(robot, 0, 0, World::NORTH)
    robot.move()
    expect(robot.report()).to eql([0, 1, World::NORTH])
  end

  it "can turn left" do
    world.place(robot, 0, 0, World::NORTH)
    robot.left()
    expect(robot.report()).to eql([0, 0, World::WEST])
  end

  it "can move multiple times" do
    world.place(robot, 1, 2, World::EAST)
    robot.move()
    robot.move()
    robot.left()
    robot.move()
    expect(robot.report()).to eql([3, 3, World::NORTH])
  end

  it "cannot move off the table" do
    world.place(robot, 4, 4, World::NORTH)
    robot.move()
    expect(robot.report()).to eql([4, 4, World::NORTH])
  end

end
