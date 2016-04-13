require "minitest/autorun"

class StopIterationError < StandardError

end

class Throw
  def throw_jump
    catch(:jump) do
      1.upto(10) do |i|
        1.upto(10) do |j|
          if i == 9 && j == 9
            throw(:jump, [i, j])
          end
        end
      end
    end
  end

  def no_throw
    1.upto(10) do |i|
      1.upto(10) do |j|
        if i == 9 && j == 9
          return [i, j]
        end
      end
    end
  end
end

class ThrowTest < MiniTest::Unit::TestCase

  describe "break loop ways" do
    before do
      @throw = Throw.new
    end

    it "should be equal use throw jump" do
      @throw.throw_jump.must_equal [9, 9]
    end

    it "should be equal use return" do
      @throw.no_throw.must_equal [9, 9]
    end
  end
end
