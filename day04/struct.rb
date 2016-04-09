require "ostruct"

User = Struct.new(:name, :age) do
  def to_s
    "name:#{name}, age:#{age}"
  end
end

u = User.new("zhangsan", 12)
puts u

User2 = OpenStruct
u2 = User2.new(name: "zhangsan", age: 12)
def u2.to_s
  "name: #{name}, age: #{age}"
end
u2.say = -> { print "hi"}
puts u2
puts u2.say.call

#结构其和类的区别在于结构体可以快速序列化和反序列号Mashload
#openstruct和struct相比在于执行速度较慢,但是可以在运行中动态添加属性,但是不能在定义时添加方法
#struct使用C写的, openstruct使用ruby写的
#API openstruct(http://ruby-doc.org/stdlib-2.0.0/libdoc/ostruct/rdoc/OpenStruct.html), struct(http://ruby-doc.org/core-2.0.0/Struct.html)
# struct 和 openstruct在传参时可以有能力控制接口的权限，相比Hash来说.
