require_relative "../command"

class StereoOffWithCDCommand < Command

  def initialize(stereo)
     @stereo = stereo
  end

  def execute
    @stereo.off
  end

end