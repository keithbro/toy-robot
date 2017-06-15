require 'robot'
require 'world'

class CLI
  def initialize()
    @robot = Robot.new
    @world = World.new
    @command_types = [ 'PLACE', 'LEFT', 'RIGHT', 'MOVE', 'REPORT' ]
  end

  def run()
    while command = gets_chomp
      break if command.eql?('')
      output = execute(command)
      puts output if output and not output.eql?("")
    end
  end

  def gets_chomp
    gets.chomp
  end

  def execute(command)
    command_type = command.split(/ /)[0]

    unless @command_types.include?(command_type)
      return "Invalid Command"
    end

    world_method = command_type.downcase
    args = ( command.split(/ /)[1] || '' )
      .split(/,/)
      .map { |arg| arg.match?(/^\d+$/) ? arg.to_i : arg }

    begin
      result = @world.send(world_method, @robot, *args)
    rescue ArgumentError
      return "Invalid Arguments"
    end

    return result.join(',') if command_type.eql?('REPORT')

    ""
  end
end
