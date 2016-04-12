require "test/unit"

class CustomerExecuteError < StandardError

end

class Task
  attr_reader :tries

  def do_raise_exception(bool)
    raise CustomerExecuteError if bool
  end

  def execute(bool)
    @tries = 0
    begin
      do_raise_exception(bool)
    rescue CustomerExecuteError => e
      raise e if @tries >= 3
      @tries += 1
      #logger.warn("API failure: #{e}, retrying...")
      sleep(5 ** @tries)
      retry
    end
  end
end

class TaskTest < Test::Unit::TestCase
  def setup
    @task = Task.new
    @task.instance_eval do
      def sleep(n)
        Kernel.send :sleep, 0.01
      end
    end
  end

  def teardown
    @task.instance_eval do
      undef :sleep
    end
  end

  def test_raise_exception
    assert_raise CustomerExecuteError do
      @task.execute(true)
    end
    assert_equal 3, @task.tries
  end

  def test_no_exception
    assert_nothing_raised CustomerExecuteError do
      @task.execute(false)
    end
    assert_equal 0, @task.tries
  end
end
