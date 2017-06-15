require 'cli'

def expect_execute(cli, command, expected_output)
  expect(cli.execute(command)).to eql(expected_output)
end

describe 'CLI.execute' do
  it 'should handle an unplaced REPORT' do
    cli = CLI.new()

    expect_execute(cli, 'REPORT', '')
  end

  it 'should handle PLACE' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', ''         )
    expect_execute(cli, 'REPORT'         , '2,2,NORTH')
  end

  it 'should handle LEFT' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', '')
    expect_execute(cli, 'LEFT'           , '')
    expect_execute(cli, 'REPORT'         , '2,2,WEST')
  end

  it 'should handle RIGHT' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', '')
    expect_execute(cli, 'RIGHT'          , '')
    expect_execute(cli, 'REPORT'         , '2,2,EAST')
  end

  it 'should handle MOVE' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', '')
    expect_execute(cli, 'MOVE'           , '')
    expect_execute(cli, 'REPORT'         , '2,3,NORTH')
  end



end
