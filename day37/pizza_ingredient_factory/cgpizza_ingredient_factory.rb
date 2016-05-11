Dir[File.join(__dir__, "..", "ingredient", "*.rb")].each { |file| require file }

require_relative "../pizza_ingredient_factory"

class CGPizzaIngredientFactory < PizzaIngredientFactory
  def create_dough
    ThickCrustDough.new
  end

  def create_sauce
    PlumTomatoSauce.new
  end

  def create_cheese
    MozzarellaCheese.new
  end

  def create_clam
    FrozenClam.new
  end
end
