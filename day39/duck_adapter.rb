require_relative "duck"

class DuckAdapter < Duck

  def initialize(turkey)
    @turkey = turkey
  end

  def quack
    @turkey.gobble
  end

  def fly
    for i in 1..10 do
      @turkey.fly
    end
  end

end