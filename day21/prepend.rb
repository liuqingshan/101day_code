require "minitest/autorun"

module A
  def self.prepended(klazz)
    puts "A#preprended by #{klazz}"
  end

  def who_am_i?
    "A#who_am_i"
  end
end
module B
  def self.prepended(klazz)
    puts "B#preprended by #{klazz}"
  end

  def who_am_i?
    "B#who_am_i"
  end
end

class C
  prepend A
  prepend B

  def who_am_i?
   "C#who_am_i"
  end
end

class CTest < MiniTest::Unit::TestCase
  def test_c
    assert C.ancestors.join(",").start_with? "B,A,C"
    assert_equal "B#who_am_i", C.new.who_am_i?
  end
end
