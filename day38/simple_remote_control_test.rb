require "test/unit"

require_relative "simple_remote_control"
require_relative "light_on_command"
require_relative "garage_door_open_command"
require_relative "light"
require_relative "garage_door"

class SimpleRemoteControlTest < Test::Unit::TestCase

  def test_remote_control
    remote = SimpleRemoteControl.new

    light = Light.new
    light_on = LightOnCommand.new(light)
    remote.set_command(light_on)
    remote.button_was_pressed

    door = GarageDoor.new
    door_open = GarageDoorOpenCommand.new(door)
    remote.set_command(door_open)
    remote.button_was_pressed
  end

end
