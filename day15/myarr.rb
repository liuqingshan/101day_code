require "minitest/autorun"
require "./prevent_inherit"

class MyArr
  extend PreventInherit
end

class MyArrTest < MiniTest::Unit::TestCase

  def test_myarr
    assert_raises(PreventInherit::InheritError) do
      Class.new MyArr do ; end
    end
  end
end
