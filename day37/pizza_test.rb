require "test/unit"

require_relative "pizza_store/nypizza_store"
require_relative "pizza_store/cgpizza_store"

class PizzaTest < Test::Unit::TestCase
  def test_pizza
    store = NYPizzaStore.new
    assert_equal "CheesePizza", store.order_pizza("cheese").class.name
    assert_equal "ClamPizza", store.order_pizza("clam").class.name

    store = CGPizzaStore.new
    assert_equal "CheesePizza", store.order_pizza("cheese").class.name
    assert_equal "ClamPizza", store.order_pizza("clam").class.name
  end
end
