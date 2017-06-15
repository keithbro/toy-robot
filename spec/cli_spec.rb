require 'cli'

describe 'CLI' do
  it 'should accept commands' do
    cli = CLI.new()
    cli.execute('PLACE 2,2,NORTH')
    output = cli.execute('REPORT')
    expect(output).to eql('2,2,NORTH')
  end
end
