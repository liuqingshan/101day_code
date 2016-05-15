require_relative "command"

class RemoteControl
  def initialize
    @on_commands = []
    @off_commands = []

    no_command = Command.new

    0.upto(7) do
      @on_commands << no_command
      @off_commands << no_command
    end
    @undo_command = no_command
  end

  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end

  def on_button_was_pressed(slot)
    @on_commands[slot].execute()
    @undo_command = @on_commands[slot]
  end

  def off_button_was_pressed(slot)
    @off_commands[slot].execute()
    @undo_command = @off_commands[slot]
  end

  def undo_button_was_pressed
    @undo_command.undo
  end

  def to_s
    str = ""
    @on_commands.each_with_index do |command, index|
      str << "[slot #{index} #{command.class.name}  #{@off_commands[index].class.name}\n"
    end
    str
  end
end
