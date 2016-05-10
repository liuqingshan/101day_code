require_relative "../pizza"

class NYStyleCheesePizza < Pizza

  def prepare
    puts "NYStyleCheesePizza ready"
  end

  def bake
    puts "NYStyleCheesePizza bake"
  end

  def cut
    puts "NYStyleCheesePizza bake"
  end

  def box
    puts "NYStyleCheesePizza box"
  end

end
