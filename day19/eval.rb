require "minitest/autorun"

class Eval

  def initialize
    @x = "I am in scope"
  end

  def i_am_a_method
    @x = "I am in a " + __method__.to_s.tr("_", " ")
    binding
  end

  def eval_in_method
    eval("@x")
  end

  def eval_in_method2
    eval("@x", i_am_a_method)
  end

  def instance_eval_in_method
    instance_eval { @x }
  end

  def instance_eval_in_method2
    instance_eval do
      def in_stack? ; false; end
    end
  end
end

class EvalTest < MiniTest::Unit::TestCase

  def setup
    @e = Eval.new
  end

  def test_eval
    assert_equal "I am in scope", @e.eval_in_method
    assert_equal "I am in a " + "i_am_a_method".to_s.tr("_", " "), @e.eval_in_method2
  end

  def test_instance_eval
    assert_equal "I am in scope", @e.instance_eval_in_method
    assert_equal :in_stack?, @e.instance_eval_in_method2
    assert_includes @e.singleton_methods(false), :in_stack?
  end
end
