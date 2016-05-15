require_relative "../command"

class StereoOffWithCDCommand < Command

  def initialize(stereo)
     @stereo = stereo
  end

  def execute
    @stereo.off
  end

  def undo
    @stereo.on
    @stereo.set_volume(11)
  end

end