require 'robot'
require 'world'

class CLI
  def initialize()
    @robot = Robot.new
    @world = World.new
    @command_types = [ 'PLACE', 'LEFT', 'RIGHT', 'MOVE', 'REPORT' ]
  end

  def run()
    puts "Robot is ready to accept commands, type EXIT to exit."

    while command = gets_chomp
      break if command.eql?('EXIT')
      output = execute(command)
      puts output unless output.nil?
    end
  end

  # Extracted to a function for mocking purposes.
  def gets_chomp
    gets.chomp
  end

  def execute(command)
    command_type = command.split(/ /)[0]

    # Whitelist valid commands to protect World instance from abuse.
    unless @command_types.include?(command_type)
      return "Invalid Command"
    end

    world_method = command_type.downcase

    # Responsibility lies with the CLI to convert strings to integers where
    # appropriate.
    args = ( command.split(/ /)[1] || '' )
      .split(/,/)
      .map { |arg| arg.match?(/^\d+$/) ? arg.to_i : arg }

    begin
      result = @world.send(world_method, @robot, *args)

    # ArgumentError is user-error whereas anything else would be unexpected
    rescue ArgumentError
      return "Invalid Arguments"
    end

    return result.join(',') if command_type.eql?('REPORT') and !result.nil?

    nil
  end
end
