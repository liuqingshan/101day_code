require 'turn/autorun' #gem install turn
require "minitest/autorun"

class RequestBase
   def self.inherited(child)
      handlers << child
      super
   end

   def self.handlers
     @handlers ||= []
   end

   private_class_method(:handlers)
end

class WebRequest < RequestBase

end

class FtpRequest < RequestBase

end

class XMLHttpRequest < WebRequest

end

class RequestBaseTest < MiniTest::Unit::TestCase

  def test_request_base
    assert_equal [WebRequest, FtpRequest], RequestBase.send(:handlers)
    refute_includes RequestBase.send(:handlers), XMLHttpRequest
  end

end
