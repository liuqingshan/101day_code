require "test/unit"

class Episode
  include Comparable

  attr_reader :number, :name

  def initialize(number, name)
    @number = number
    @name = name
  end

  def <=>(other)
    return nil unless other.is_a?(Episode)
    @number <=> other.number
  end

  #默认eql?是和equals实现相同，现在用comparable模块的==方法代替
  alias_method :eql?, :==

  def hash
    @number.hash
  end
end

class TestMovie < Test::Unit::TestCase
  def setup
    @numbers = %w(1.1 2.1 3.2 1.8 2.3 1.1)
    @episodes = @numbers.map do |num|
      Episode.new(num, "some Movie")
    end
  end

  def teardown
    @numbers = nil
    @episodes = nil
  end

  def test_sort
    assert @numbers.sort != @episodes.map(&:number)
    assert @numbers.sort == @episodes.sort.map(&:number)
  end

  def test_hash
    hash = @episodes.reduce({}) do |r, e|
      r[e] = true
      r
    end
    assert hash.size == @episodes.size - 1
  end

  def test_comparable
    assert @episodes[1] < @episodes[2]
    assert @episodes[1] <= @episodes[2]
    assert Episode.new("1.5", "Some Movie").between?(@episodes[0], @episodes[1])
    #include comparable后Episode类会加6个方法 <, <=, >, >=, ==, between?
  end

end
