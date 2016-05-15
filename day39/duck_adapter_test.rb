require "test/unit"

require_relative "turkey"
require_relative "duck_adapter"
require_relative "mallard_duck"

class DuckAdapterTest < Test::Unit::TestCase

  def test_adapter
    mallard_duck = MallardDuck.new

    mallard_duck.fly
    mallard_duck.quack

    turkey = Turkey.new
    adapter = DuckAdapter.new(turkey)

    adapter.fly
    adapter.quack
  end
end