require 'robot'
require 'world'

class CLI
  def initialize()
    @robot = Robot.new
    @world = World.new
  end

  def execute(command)
    command_type = command.split(/ /)[0]

    unless [ 'PLACE', 'LEFT', 'RIGHT', 'MOVE', 'REPORT' ].include?(command_type)
      return "Invalid Command"
    end

    world_method = command_type.downcase
    args = ( command.split(/ /)[1] || '' )
      .split(/,/)
      .map { |arg| arg.match?(/^\d+$/) ? arg.to_i : arg }

    begin
      result = @world.send(world_method, @robot, *args)
    rescue
      return "Invalid Command"
    end

    return result.join(',') if command_type.eql?('REPORT')

    ""
  end
end
