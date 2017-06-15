require 'cli'

describe 'CLI.execute' do
  it 'should handle an empty REPORT' do
    cli = CLI.new()

    expect(
      cli.execute('REPORT')
    ).to eql('')
  end

  it 'should handle a PLACE' do
    cli = CLI.new()

    expect(
      cli.execute('PLACE 2,2,NORTH')
    ).to eql('')

    expect(
      cli.execute('REPORT')
    ).to eql('2,2,NORTH')
  end
end
