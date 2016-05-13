class SimpleRemoteControl
   def set_command(command)
     @slot = command
   end

   def button_was_pressed
     @slot.execute
   end
end
