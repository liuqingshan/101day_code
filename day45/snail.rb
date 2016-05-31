require "minitest/autorun"

class TestSnail < MiniTest::Unit::TestCase

  def test_snail
    assert_equal([1, 2, 3, 6, 9, 8, 7, 4, 5], snail([[1,2,3],[4,5,6],[7,8,9]]))
    assert_equal([1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13], snail([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]]))
  end

  def snail(array)

    return [] if array.flatten.empty?
    return array.first if array.flatten.length == 1

    array_length = array.length ** 2

    flags = Array.new(array.length * array.length, false)
    result = []
    i, j = 0, 0

    while result.length < array_length

      while j < array.length && j < array.length && !flags[i * array.length + j]
        result.push(array[i][j])
        flags[i* array.length + j] = true
        if j == array.length - 1 || flags[i * array.length + j + 1]
          i += 1
          break
        else
          j += 1
        end
      end

      while j < array.length && j < array.length && !flags[i * array.length + j]
        result.push(array[i][j])
        flags[i* array.length + j] = true
        if i == array.length - 1 || flags[(i + 1) * array.length + j]
          j -= 1
          break
        else
          i += 1
        end
      end

      while j < array.length && j < array.length && !flags[i * array.length + j]
        result.push(array[i][j])
        flags[i* array.length + j] = true
        if j == 0 || flags[i * array.length + j - 1]
          i -= 1
          break
        else
          j -= 1
        end
      end

      while j < array.length && j < array.length && !flags[i * array.length + j]
        result.push(array[i][j])
        flags[i* array.length + j] = true
        if i == 0 || flags[(i - 1) * array.length + j]
          j += 1
          break
        else
          i -= 1
        end
      end
    end
    result
  end
end
