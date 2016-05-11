Dir[File.join(__dir__, "..", "ingredient", "*.rb")].each { |file| require file }

require_relative "../pizza_ingredient_factory"

class NYPizzaIngredientFactory < PizzaIngredientFactory
  def create_dough
    ThinCrustDough.new
  end

  def create_sauce
    MarinaraSauce.new
  end

  def create_cheese
    ReggianoCheese.new
  end

  def create_clam
    FreshClam.new
  end

end
