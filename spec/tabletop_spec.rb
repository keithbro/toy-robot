require "tabletop"

describe Tabletop do
  it "understands left and right rotations" do
    tabletop = Tabletop.new

    expect(tabletop.left('NORTH')).to eql('WEST')
    expect(tabletop.left('WEST')).to eql('SOUTH')
    expect(tabletop.left('SOUTH')).to eql('EAST')
    expect(tabletop.left('EAST')).to eql('NORTH')

    expect(tabletop.right('NORTH')).to eql('EAST')
    expect(tabletop.right('EAST')).to eql('SOUTH')
    expect(tabletop.right('SOUTH')).to eql('WEST')
    expect(tabletop.right('WEST')).to eql('NORTH')
  end
end
