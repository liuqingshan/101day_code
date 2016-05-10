require_relative "../pizza_store"
require_relative "../pizza/nystyle_cheese_pizza"
require_relative "../pizza/nystyle_clam_pizza"

class NYPizzaStore < PizzaStore

  def create_pizza(type)
    if type == "cheese"
      NYStyleCheesePizza.new
    else
      NYStyleClamPizza.new
    end
  end
end
