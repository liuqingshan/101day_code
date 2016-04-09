require_relative "inherit"
require "test/unit"

class TestInherit < Test::Unit::TestCase

  def test_inherit
    cc1 = CC1.new
    assert_equal cc1.m1, "CC1.m1", "如果子类中已经定义了要调用的方法，则调用子类中的方法"

    cc2 = CC2.new
    assert_equal cc2.m1, "M1.m1", "如果子类中没有定义要调用的方法, 则调用include的模块中的方法"

    cc3 = CC3.new
    assert_equal cc3.m1, "C1.m1", "如果子类中没有定义要调用的方法，且没有include模块，则继续调用父级对象中的方法"
  end
end
