require "test/unit"

class My1Error < StandardError

end

class My2Error < StandardError
  attr_reader :msg

  def initialize(message)
    @msg = message
    super("message error: #{@msg}")
  end
end

class MyErrorTest < Test::Unit::TestCase
   def test_myerror
     assert_raise My1Error do
       raise My1Error
     end

     assert_raise My2Error do
       raise My2Error.new("test")
     end
   end
end
