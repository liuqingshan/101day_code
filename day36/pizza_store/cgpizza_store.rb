require_relative "../pizza_store"
require_relative "../pizza/cgstyle_cheese_pizza"
require_relative "../pizza/cgstyle_clam_pizza"

class CGPizzaStore < PizzaStore

  def create_pizza(style)
    if style == "cheese"
      CGStyleCheesePizza.new()
    else
      CGStyleClamPizza.new()
    end
  end
end
