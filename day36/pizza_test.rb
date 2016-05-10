require "test/unit"

require_relative "pizza_store/nypizza_store"
require_relative "pizza_store/cgpizza_store"

class PizzaTest < Test::Unit::TestCase
  def test_pizza
    store = NYPizzaStore.new
    assert_equal "NYStyleCheesePizza", store.order_pizza("cheese").class.name
    assert_equal "NYStyleClamPizza", store.order_pizza("clam").class.name

    store = CGPizzaStore.new
    assert_equal "CGStyleCheesePizza", store.order_pizza("cheese").class.name
    assert_equal "CGStyleClamPizza", store.order_pizza("clam").class.name
  end
end
