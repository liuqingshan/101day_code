require_relative "../pizza"

class ClamPizza < Pizza

  def initialize(factory)
    @factory = factory
  end

  def prepare
    puts "preparing"
    dough = @factory.create_dough
    sauce = @factory.create_sauce
    cheese = @factory.create_cheese
    clam = @factory.create_clam
  end

end
