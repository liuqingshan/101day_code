require_relative "../command"

class GarageDoorOpenCommand < Command
  def initialize(door)
    @door = door
  end

  def execute
    @door.light_on
    @door.up
  end

  def undo
    @door.light_off
    @door.down
  end
end
