require_relative "../pizza"

class CGStyleCheesePizza < Pizza

  def prepare
    puts "CGStyleCheesePizza ready"
  end

  def bake
    puts "CGStyleCheesePizza bake"
  end

  def cut
    puts "CGStyleCheesePizza bake"
  end

  def box
    puts "CGStyleCheesePizza box"
  end

end
