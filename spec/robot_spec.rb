require "robot"
require "tabletop"

describe Robot do
  it "ignores commands if it's not on the table" do
    robot = Robot.new
    expect(robot.report()).to eql(nil)
    expect(robot.move()).to eql(nil)
    expect(robot.left()).to eql(nil)
    expect(robot.right()).to eql(nil)
  end

  it "can report its status" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 1, 2, 'SOUTH')

    expect(robot.report()).to eql([1, 2, 'SOUTH'])
  end

  it "can move forward one unit" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 0, 0, 'NORTH')
    robot.move()

    expect(robot.report()).to eql([0, 1, 'NORTH'])
  end

  it "can turn left" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 0, 0, 'NORTH')
    robot.left()

    expect(robot.report()).to eql([0, 0, 'WEST'])
  end

  it "can turn right" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 0, 0, 'NORTH')
    robot.right()

    expect(robot.report()).to eql([0, 0, 'EAST'])
  end

  it "can move multiple times" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 1, 2, 'EAST')
    robot.move()
    robot.move()
    robot.left()
    robot.move()

    expect(robot.report()).to eql([3, 3, 'NORTH'])
  end

  it "cannot move off the tabletop" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 4, 4, 'NORTH')
    robot.move()

    expect(robot.report()).to eql([4, 4, 'NORTH'])
  end

  it "cannot be placed off the tabletop" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 7, -3, 'NORTH')

    expect(robot.report()).to eql(nil)
  end

  it "cannot be placed in an invalid direction" do
    robot = Robot.new
    tabletop = Tabletop.new

    robot.place(tabletop, 1, 1, 'UP')

    expect(robot.report()).to eql(nil)
  end

end
