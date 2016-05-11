require_relative "../pizza"

class CheesePizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    print "preparing"
    dough = @factory.create_dough
    sauce = @factory.create_sauce
    cheese = @factory.create_cheese
  end
end
