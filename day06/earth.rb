require "test/unit"
require "singleton"

class Earth
  include Singleton
end

class Earth2
  private_class_method :new, :clone, :dup

  def self.instance
    @singleton ||= new
  end
end

class EarthTest < Test::Unit::TestCase

  def test_singleton
    common_test(Earth)
  end

  def test_custom_singleton
    common_test(Earth2)
  end

  def common_test(clazz)
    assert_raise(NoMethodError) { clazz.new }
    assert_raise(NoMethodError) { clazz.new.dup }
    assert_raise(NoMethodError) { clazz.new.clone }

    earth = clazz.instance
    earth2 = clazz.instance
    assert earth.equal?(earth2)
    assert earth.object_id == earth2.object_id
  end
end
