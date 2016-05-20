require "test/unit"

require_relative "leaf"
require_relative "composite"

class ComponentTest < Test::Unit::TestCase

  def test_component
    leaf = Leaf.new

    root = Composite.new

    composite = Composite.new
    root.add(leaf)

    composite = Composite.new
    root.add(leaf)

    composite1 = Composite.new
    composite11 = Composite.new
    composite11.add(Leaf.new)

    composite1.add(composite11)

    root.add(composite1)

    root.operation do |element|
      puts "=" * element.child_size + element.class.name
    end

  end
end