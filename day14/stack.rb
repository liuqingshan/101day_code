require "./superforwardable.rb"
require "test/unit"

class Stack
  extend(SuperForwardable)

  def_delegators(:@arr, :[], :[]=, :push, :pop, :empty?, :clear, :size)
  def_delegators_with_super(:@arr, :freeze, :taint, :untaint)

  def initialize
    @arr = []
  end

  def m1
  end

  def initialize_copy(other)
    @arr = @arr.dup
  end
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
