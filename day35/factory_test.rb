require "test/unit"

require_relative "pen_store"
require_relative "pen1_factory"

class FactoryTest < Test::Unit::TestCase

  def test_factory
    factory = Pen1Factory.new
    store = PenStore.new(factory)
    assert_equal "CirclePen", store.order_pen("circle").class.name
    assert_equal "SquarePen", store.order_pen("square").class.name
  end
end
