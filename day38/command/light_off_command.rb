require_relative "../command"

class LightOffCommand < Command

  def initialize(light)
     @light = light
  end

  def execute
    @light.off
  end
end