require_relative "component"

class Composite < Component

  def initialize
    @arr = []
  end

  def add(component)
    @arr.push(component)
  end

  def remove(component)

  end

  def get_child(index)
     @arr[index]
  end

  def operation(&block)
    block.call(self)

    for e in @arr
      e.operation(&block)
    end
  end

  def child_size
    @arr.size
  end

end
