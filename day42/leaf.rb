require_relative "component"

class Leaf < Component

  def operation(&block)
     block.call(self)
  end

  def child_size
    0
  end
end