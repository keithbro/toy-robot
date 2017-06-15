require 'robot'
require 'world'

class CLI
  def initialize()
    @robot = Robot.new
    @world = World.new
  end

  def execute(command)
    world_method = command.split(/ /)[0].downcase
    args = ( command.split(/ /)[1] || '' )
      .split(/,/)
      .map { |arg| arg.match?(/^\d+$/) ? arg.to_i : arg }

    result = @world.send(world_method, @robot, *args)

    return result.join(',') if world_method.eql?('report')

    ""
  end
end
