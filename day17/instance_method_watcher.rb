require "minitest/autorun"

class InstanceMethodWatcher

  %w(method_added method_removed method_undefined singleton_method_added singleton_method_removed singleton_method_undefined).each do |method_name|
    define_singleton_method method_name do |m|
      @message = "#{m} #{method_name}"
    end
  end
end

class InstanceMethodWatcherTest < MiniTest::Unit::TestCase

  def test_instance_callback_method
    assert_instance_method_watcher_class(:method_added) do
      def hello; end
    end

    assert_instance_method_watcher_class(:method_removed) do
      remove_method(:hello)
    end

    assert_instance_method_watcher_class(:method_undefined) do
      def hello; end
      undef_method(:hello)
    end
  end

  def test_instance_singleton_callback_method
    assert_instance_method_watcher_class(:singleton_method_added) do
      class << self
        def hello; end
      end
    end

    assert_instance_method_watcher_class(:singleton_method_removed) do
      class << self
        remove_method(:hello)
      end
    end

    assert_instance_method_watcher_class(:singleton_method_undefined) do
      class << self
        def hello; end
        undef_method(:hello)
      end
    end
  end

  def assert_instance_method_watcher_class(method, &block)
    InstanceMethodWatcher.class_eval(&block)
    assert_equal "hello #{method}", InstanceMethodWatcher.instance_variable_get("@message")
  end
end
