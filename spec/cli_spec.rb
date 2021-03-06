require 'cli'

describe 'CLI.execute' do
  it 'should handle an unplaced REPORT' do
    cli = new_cli()

    expect_execute(cli, 'REPORT', nil)
  end

  it 'should handle PLACE' do
    cli = new_cli()

    expect_execute(cli, 'PLACE 2,2,NORTH', nil)
    expect_execute(cli, 'REPORT'         , '2,2,NORTH')
  end

  it 'should handle LEFT' do
    cli = new_cli()

    expect_execute(cli, 'PLACE 2,2,NORTH', nil)
    expect_execute(cli, 'LEFT'           , nil)
    expect_execute(cli, 'REPORT'         , '2,2,WEST')
  end

  it 'should handle RIGHT' do
    cli = new_cli()

    expect_execute(cli, 'PLACE 2,2,NORTH', nil)
    expect_execute(cli, 'RIGHT'          , nil)
    expect_execute(cli, 'REPORT'         , '2,2,EAST')
  end

  it 'should handle MOVE' do
    cli = new_cli()

    expect_execute(cli, 'PLACE 2,2,NORTH', nil)
    expect_execute(cli, 'MOVE'           , nil)
    expect_execute(cli, 'REPORT'         , '2,3,NORTH')
  end

  it 'should handle invalid commands' do
    cli = new_cli()

    expect_execute(cli, 'PLACE 2,2,NORTH', nil)
    expect_execute(cli, 'JUMP'           , 'Invalid Command')
    expect_execute(cli, 'REPORT'         , '2,2,NORTH')
  end

  it 'should handle invalid args' do
    cli = CLI.new(3, 3)

    expect_execute(cli, 'PLACE' , 'Invalid Arguments')
    expect_execute(cli, 'REPORT', nil)
  end

  it 'should handle negative integer arguments' do
    cli = new_cli()

    expect_execute(cli, 'PLACE -1,-1,NORTH', nil)
  end
end

describe 'CLI.run' do
  expected_greeting = "Robot is ready to accept commands, type EXIT to exit."

  it 'should accept EXIT to exit' do
    expect_stdout(
      [ 'PLACE 2,3,EAST', 'REPORT', 'EXIT' ],
      "#{expected_greeting}\n2,3,EAST\n",
    )
  end

  it 'should greet the user' do
    expect_stdout([ 'EXIT' ], "#{expected_greeting}\n")
  end
end

# Given a single command to issue via the CLI, assert that the return value is
# as expected.

def expect_execute(cli, command, expected_output)
  expect(cli.execute(command)).to eql(expected_output)
end

# Given an array of commands to issue via the CLI, assert that the STDOUT is as
# expected.
def expect_stdout(commands, expected_stdout)
  cli = new_cli()

  mock_stdout = StringIO.new
  $stdout = mock_stdout

  allow(cli).to receive(:get_command).and_return(*commands)
  cli.run()
  expect(mock_stdout.string).to eql(expected_stdout)
end

def new_cli
  CLI.new(3, 4)
end
