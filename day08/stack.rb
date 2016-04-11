require "forwardable"
require "test/unit"

class Stack
  extend Forwardable

  def initialize
    @arr = []
  end

  def m1
  end

  def_delegators(:@arr, :[], :[]=, :push, :pop, :empty?, :clear, :size)
  #def_delegators第一个参数是要代理的对象

  def initialize_copy(other)
    @arr = @arr.dup
  end

  [:freeze, :tainting, :untainting].each do |method_name|
    define_method method_name do |*args|
      @arr.send(method_name)
      super(*args)
    end
  end
  #对代理对象进行相同的操作
  #tainting是对对象进行读脏处理，如果对象已经脏了，则新建的任何对象也是脏的，用untainting来洗掉!
end

class StackTest < Test::Unit::TestCase
  def test_stack
    stack = Stack.new
    stack.push :a, :b
    stack.pop
    assert stack.size == 1
    assert stack.empty? == false

    stack.pop
    assert stack.empty?

    stack.push :c
    stack.clear
    assert stack.empty?

    assert stack.methods.include?(:m1), "可以自定义方法"

    stack2 = stack.dup

    stack.push :d
    assert stack2.size == 0
    assert stack.size == 1

    stack.freeze
    assert_raise RuntimeError do
      stack.push :e
    end
  end
end
