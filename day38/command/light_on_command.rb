require_relative "../command"

class LightOnCommand < Command

  def initialize(light)
    @light = light
  end

  def execute()
    @light.on
  end

  def undo
    @light.off
  end
end
