require 'cli'

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

  it 'should handle invalid commands' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', '')
    expect_execute(cli, 'JUMP'           , 'Invalid Command')
    expect_execute(cli, 'REPORT'         , '2,2,NORTH')
  end

  it 'should handle invalid args' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE' , 'Invalid Arguments')
    expect_execute(cli, 'REPORT', '')
  end
end

describe 'CLI.run' do
  it 'should accept empty string to exit' do
    cli = CLI.new()

    mock_stdout = StringIO.new
    $stdout = mock_stdout
    allow(cli).to receive(:gets_chomp).and_return('PLACE 2,3,EAST', 'REPORT', '')

    cli.run()
    expect(mock_stdout.string).to eql("2,3,EAST\n")
  end
end

def expect_execute(cli, command, expected_output)
  expect(cli.execute(command)).to eql(expected_output)
end


