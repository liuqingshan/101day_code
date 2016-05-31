#encoding utf8

require "test/unit"

class TestRange < Test::Unit::TestCase

  def test_solution
     assert_equal("-6,-3-1,3-5,7-11,14,15,17-20", solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]))
  end

  def solution(list)
    stack = []
    result = []
    list.push(nil)
    list.each do |e|
      if stack.empty? || stack.last + 1 == e
        stack.push e
      else
        if stack.length >= 3
          result << "#{stack.first}-#{stack.last}"
        else
          stack.each do |ee|
            result << ee.to_s
          end
        end
        stack = [e]
      end
    end
    list.pop
    result.join(",")
  end
end
