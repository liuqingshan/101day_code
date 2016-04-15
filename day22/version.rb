class Version
  include Comparable
  attr_reader :major, :minor, :patch

  def initialize(version)
    @version = version
    @major, @minor, @patch = version.split(".").map(&:to_i)
  end
  
  def <=> (other)
    return nil unless other.is_a?(Version)
    
    [@major <=> other.major,
     @minor <=> other.minor,
     @patch <=> other.patch
    ].detect {|x| !x.zero? } || 0
  end
  
  alias_method :eql?, :==
  
  def hash
    [major, minor, patch].hash
  end
end
