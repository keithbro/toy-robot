require 'cli'

def expect_execute(cli, command, expected_output)
  expect(cli.execute(command)).to eql(expected_output)
end

describe 'CLI.execute' do
  it 'should handle an empty REPORT' do
    cli = CLI.new()

    expect_execute(cli, 'REPORT', '')
  end

  it 'should handle a PLACE' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', ''         )
    expect_execute(cli, 'REPORT'         , '2,2,NORTH')
  end

  it 'should handle a LEFT' do
    cli = CLI.new()

    expect_execute(cli, 'PLACE 2,2,NORTH', '')
    expect_execute(cli, 'LEFT'           , '')
    expect_execute(cli, 'REPORT'         , '2,2,WEST')
  end

end
