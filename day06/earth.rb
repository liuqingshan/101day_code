require "test/unit"
require "singleton"

class Earch
  include Singleton
end

class EarthTest < Test::Unit::TestCase

  def test_singleton
    earth = Earch.instance
    earth2 = Earch.instance
    assert earth.equal?(earth2)
    assert earth.object_id == earth2.object_id
  end
end
