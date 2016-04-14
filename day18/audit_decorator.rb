require "minitest/autorun"
require "logger"

class AuditDecorator
  def initialize(object)
    @object = object
    @log = Logger.new($stdout)

    mod = Module.new do
      object.public_methods.each do |method|
        define_method method do |*args, &block|
          @log.warn("logger before")
          @object.send(method, *args, &block)
        end
      end
    end
    extend(mod)

    #@object.public_methods.each do |name|
    #  define_singleton_method(name) do |*args, &block|
    #    @log.warn("logger before #{name} ---> #{@object.inspect}")
    #    @object.send(name, *args, &block)
    #  end
    #end
    # 为什么没有调用定义的发方法还会执行呢？
  end
end

class AuditDecoratorTest < MiniTest::Unit::TestCase
  def test_audit_decorator
    str = "I am a string"
    fake = AuditDecorator.new(str)
    assert_equal str.downcase, fake.downcase
    assert_equal str.class, fake.class
  end
end
