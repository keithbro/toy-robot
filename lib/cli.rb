require 'robot'
require 'tabletop'

class CLI
  def initialize()
    @robot = Robot.new
    @tabletop = Tabletop.new
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

  # Executes a single command. Returns an appropriate string message if the
  # command or the arguments are invalid. Returns a string message in the case
  # of REPORT. Otherwise returns nil.

  def execute(command)
    command_type = command.split(/ /)[0]

    # Whitelist valid commands to protect Tabletop instance from abuse.
    unless @command_types.include?(command_type)
      return "Invalid Command"
    end

    robot_method = command_type.downcase

    # Responsibility lies with the CLI to convert strings to integers where
    # appropriate.
    args = ( command.split(/ /)[1] || '' )
      .split(/,/)
      .map { |arg| arg.match?(/^\d+$/) ? arg.to_i : arg }

    args.unshift(@tabletop) if command_type.eql?('PLACE')

    begin
      result = @robot.send(robot_method, *args)

    # ArgumentError is user error whereas anything else would be unexpected
    rescue ArgumentError
      return "Invalid Arguments"
    end

    return result.join(',') if command_type.eql?('REPORT') and !result.nil?

    nil
  end
end
