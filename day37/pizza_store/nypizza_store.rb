Dir[File.join(__dir__, "..", "pizza_ingredient_factory", "*.rb")].each { |file| require file }

require_relative "../pizza_store"
require_relative "../pizza/cheese_pizza"
require_relative "../pizza/clam_pizza"

class NYPizzaStore < PizzaStore

  def create_pizza(type)
    factory = NYPizzaIngredientFactory.new
    if type == "cheese"
      CheesePizza.new(factory)
    else
      ClamPizza.new(factory)
    end
  end
end
