class C1
  attr_accessor :name

  def initialize(name)
    print "super initialize\n"
    @name = name
  end

  def initialize_copy(other)
    print "super copy\n"
  end
end

class CC1 < C1
  attr_accessor :age

  def initialize(name, age)
    print "initialize\n"
    super(name)
    @age = age
  end

  def initialize_copy(other)
    print "initialize_copy\n"
    super
  end

  def initialize_clone(other)
    super
    print "initialize_clone\n"
  end

  def initialize_dup(other)
    print "initialize_dup\n"
    super
  end
end

p CC1.new("zhangsan", 12).clone.name
print "===========\n"
p CC1.new("zhangsan", 12).dup.name

# 定义子类构造时候，需要显式的调用super方法
# 当clone或者dup的时候会调用相应的initialize_开头的方法，但是都会调用initialize_copy方法
