class C1
  def initialize
    @name = "zhangsan"
  end
end

class C2
  attr_accessor :name

  def initialize
    self.name = "zhangsan"
  end
end

class C3
  attr_accessor :name

  def initialize
    @name = "zhangsan"
  end
end

c1 = C1.new
c1.name #exception

c2 = C2.new
c2.name #zhangsan

c3 = C3.new
c3.name #zhangsan

#attr_accessor 实际上已经产生实力变量@name, 所以在C3类中可以直接赋值, 在C2类中只是间接赋值了而已.
