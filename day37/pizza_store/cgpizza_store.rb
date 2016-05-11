require_relative "../pizza/cheese_pizza"
require_relative "../pizza/clam_pizza"

Dir[File.join(__dir__, "..", "pizza_ingredient_factory", "*.rb")].each { |file| require file }

class CGPizzaStore < PizzaStore

  def create_pizza(style)
    factory = NYPizzaIngredientFactory.new
    if style == "cheese"
      CheesePizza.new(factory)
    else
      ClamPizza.new(factory)
    end
  end
end
