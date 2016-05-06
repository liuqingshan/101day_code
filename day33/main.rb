require_relative "duck"
require_relative "fly_no_way"
require_relative "fly_with_wings"

duck = Duck.new
duck.perform_fly
duck.set_fly_behavior(FlyWithWings.new)
duck.perform_fly
