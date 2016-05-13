require "test/unit"

require_relative "remote_control"

require_relative "command/light_on_command"
require_relative "command/light_off_command"
require_relative "command/garage_door_open_command"
require_relative "command/garage_door_close_command"
require_relative "command/stereo_on_with_cd_command"
require_relative "command/stereo_off_with_cd_command"

require_relative "light"
require_relative "garage_door"
require_relative "stereo"

class RemoteControlTest < Test::Unit::TestCase

  def test_remote_control
    remote = RemoteControl.new

    light = Light.new
    light_on = LightOnCommand.new(light)
    light_off = LightOffCommand.new(light)
    remote.set_command(0, light_on, light_off)
    remote.on_button_was_pressed(0)
    remote.off_button_was_pressed(0)

    door = GarageDoor.new
    door_open = GarageDoorOpenCommand.new(door)
    door_off = GarageDoorCloseCommand.new(door)
    remote.set_command(1, door_open, door_off)
    remote.on_button_was_pressed(1)
    remote.off_button_was_pressed(1)

    stereo = Stereo.new
    stereo_on = StereoOnWithCDCommand.new(stereo)
    stereo_off = StereoOffWithCDCommand.new(stereo)
    remote.set_command(2, stereo_on, stereo_off)
    remote.on_button_was_pressed(2)
    remote.off_button_was_pressed(2)
  end

end
