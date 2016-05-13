require_relative "../command"

class GarageDoorCloseCommand < Command
  def initialize(door)
    @door = door
  end

  def execute
    @door.light_off
    @door.down
  end
end
