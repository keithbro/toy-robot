require "tabletop"

describe Tabletop do
  it "understands left and right rotations" do
    tabletop = Tabletop.new(4, 4)

    expect(tabletop.direction_after_left_turn('NORTH')).to eql('WEST')
    expect(tabletop.direction_after_left_turn('WEST')).to eql('SOUTH')
    expect(tabletop.direction_after_left_turn('SOUTH')).to eql('EAST')
    expect(tabletop.direction_after_left_turn('EAST')).to eql('NORTH')

    expect(tabletop.direction_after_right_turn('NORTH')).to eql('EAST')
    expect(tabletop.direction_after_right_turn('EAST')).to eql('SOUTH')
    expect(tabletop.direction_after_right_turn('SOUTH')).to eql('WEST')
    expect(tabletop.direction_after_right_turn('WEST')).to eql('NORTH')

    expect {
      tabletop.direction_after_left_turn('UP')
    }.to raise_exception('Invalid initial direction (UP)')

    expect {
      tabletop.direction_after_right_turn('UP')
    }.to raise_exception('Invalid initial direction (UP)')
  end

  it "understands forward movements" do
    tabletop = Tabletop.new(10, 15)

    expect(
      tabletop.coords_after_move(0, 0, 'NORTH')
    ).to eql([0, 1])

    expect(
      tabletop.coords_after_move(0, 0, 'EAST')
    ).to eql([1, 0])

    expect(
      tabletop.coords_after_move(0, tabletop.max_y, 'SOUTH')
    ).to eql([0, tabletop.max_y - 1])

    expect(
      tabletop.coords_after_move(tabletop.max_x, 0, 'WEST')
    ).to eql([tabletop.max_x - 1, 0])

    expect {
      tabletop.coords_after_move(-1, -1, 'SOUTH')
    }.to raise_exception('Invalid initial state (-1, -1, SOUTH)')

    expect {
      tabletop.coords_after_move(0, 0, 'UP')
    }.to raise_exception('Invalid initial state (0, 0, UP)')
  end
end
