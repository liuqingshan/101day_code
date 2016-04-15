require "minitest/autorun"

module Reset
  def self.reset_var2(object, name)
    object.instance_exec("@#{name}".to_sym) do |var|
      const = self.class.const_get(:DEFAULT)
      instance_variable_set(var, const)
    end
  end

  def self.reset_var(object, name)
    object.instance_eval("@#{name} = DEFAULT")
  end
end

class Counter

  DEFAULT = 0

  attr_reader :counter

  def initialize(start=DEFAULT)
    @counter = start    
  end
  
  def inc
    @counter += 1
  end
end


class CounterTest < MiniTest::Unit::TestCase
  
  def setup
    @counter = Counter.new(10)
  end

  def test_reset1
    Reset.reset_var(@counter, "counter")
    assert_equal 0, @counter.counter
   
    Reset.reset_var(@counter, "x; @y")
    assert_equal 0, @counter.instance_variable_get("@y")
    #inject success
  end

  def test_reset2
    Reset.reset_var(@counter, "counter")
    assert_equal 0, @counter.counter
   
    assert_raises NameError do 
      Reset.reset_var2(@counter, "x; @y")
    end
    #inject failure
  end 
end
