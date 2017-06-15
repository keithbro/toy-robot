require "world"

describe World do
  world = World.new()
  robot = Robot.new()

  it "cannot place something off the table" do
    expect {
      world.place(robot, 5, 5, 'NORTH')
    }.to raise_error(RuntimeError, "Invalid position (5, 5)")

    expect {
      world.place(robot, -1, -1, 'NORTH')
    }.to raise_error(RuntimeError, "Invalid position (-1, -1)")
  end
end
