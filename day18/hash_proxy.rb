require "minitest/autorun"

class HashProxy
   def initialize
     @hash = {}
   end

   Hash.instance_methods(false).each do |method|
     define_method method do |*args, &block|
        @hash.send_method(*args, &block)
     end
   end
end

class HashProxyTest < MiniTest::Unit::TestCase
   def setup
     @hash_proxy = HashProxy.new
   end

   def test_hash_proxy
     Hash.instance_methods(false).each do |method|
       assert @hash_proxy.respond_to?(:method)
     end
   end
end
