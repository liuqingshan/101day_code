require_relative "../command"

class StereoOnWithCDCommand < Command

  def initialize(stereo)
     @stereo = stereo
  end

  def execute
    @stereo.on
    @stereo.set_cd
    @stereo.set_volume(11)
  end

end