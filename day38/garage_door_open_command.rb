require_relative "command"

class GrageDoorOpenCommand < Command
  def initialize(door)
    @door = door
  end

  def execute
    @door.light_on
    @door.up
  end
end
