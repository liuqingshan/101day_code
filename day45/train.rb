require "minitest/autorun"

class TrainTest < MiniTest::Unit::TestCase

  def test_train
    secret_1 = "whatisup"
    triplets_1 = [
      ['t','u','p'],
      ['w','h','i'],
      ['t','s','u'],
      ['a','t','s'],
      ['h','a','p'],
      ['t','i','s'],
      ['w','h','s']
    ]

    assert_equal(recover_secret(triplets_1), secret_1)
  end
  def recover_secret triplets
    hash, arr = flatten(triplets)
    first_char = (arr - hash.keys).first
    r = prev_char(hash, first_char)
    r.reverse.push(first_char).join
  end

  def flatten(triplets)
    word = {}
    arr = []
    triplets.each do |one, two, three|
      word[one] = [] if word[one].nil?
      word[one] << two
      word[two] = [] if word[two].nil?
      word[two] << three
      arr << one
      arr << two
      arr << three
    end
    [word, arr]
  end

  def prev_char(hash, first_char)
    find_prev(hash, first_char, [], hash.keys.length)
  end

  def find_prev(hash, char, arr, hash_length)
    puts "#{char}, #{arr}"
    hash.each do |k, v|
      if v.include? char
        arr.push k
        find_prev(hash, k, arr, hash_length)
        return arr if arr.length == hash_length
        arr.pop
      end
    end
    []
  end

end
