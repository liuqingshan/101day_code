require "test/unit"
require "set"

#自定义类时，==和equal?方法的行为一致，都是通过是否指向同一内存来比较的
class Book
  def initialize(name)
    @name = name
  end
end

class Book2

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def hash
    @name.hash
  end

  def eql?(other)
    @name.eql?(other.name)
  end
end

class TestBook < Test::Unit::TestCase

  def test_string_and_num
    assert_not_equal true, "foo" == "bar" #比较对象的值是否相等
    assert_not_equal true, "foo".equal?("foo") #和java的用法相反，此方法比较两个对象是否指向同一个内存空间

    assert 1 == 1.0 #非严格比较，会进行类型转换
    assert_equal false, 1.eql?(1.0) #eql? 严格比较，不进行类型转换
  end

  def test_book
    book1 = Book.new("人月神话")
    book2 = Book.new("人月神话")
    books = Set.new [book1, book2]
    assert 2 == books.size, "默认实现下则通过object_id来比较"

    hash = { book1 => "love", book2 => "like" }
    assert 2 == hash.size, "此规则同样适合于hash"
  end

  def test_book2
    book1 = Book2.new("人月神话")
    book2 = Book2.new("人月神话")
    books = Set.new [book1, book2]
    assert 1 == books.size, "自定义hash和eql?方法,必须同时定义"

    hash = { book1 => "love", book2 => "like" }
    assert 1 == hash.size, "此规则同样适合于hash"
  end

  def test_equal_equal_equal
    #===很少用到，默认实现和==相同, 常用在when 语句中
    #类和模块中有一个默认实现，如果右操作符是左边操作符的一个实现，则返回true,类似于is_a?
    #由于ruby中左操作符是消息的接收者，意味着用===时只能把定义了===的对象实例放到左边
    assert_equal true, (/\w/) === "a"
    assert_equal false, "a" == /w/
    assert_equal false, (/\w/) === "@"
  end
end
