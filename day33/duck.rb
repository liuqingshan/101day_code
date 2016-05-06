require_relative "fly_no_way"

class Duck

  attr_writer :behavior

  def initialize
    @behavior = FlyNoWay.new
  end

  def set_fly_behavior(behavior)
    @behavior = behavior
  end

  def perform_fly
    @behavior.fly
  end
end
