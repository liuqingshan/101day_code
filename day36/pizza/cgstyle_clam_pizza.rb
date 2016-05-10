require_relative "../pizza"

class CGStyleClamPizza < Pizza

  def prepare
    puts "CGStyleClamPizza ready"
  end

  def bake
    puts "CGStyleClamPizza bake"
  end

  def cut
    puts "CGStyleClamPizza bake"
  end

  def box
    puts "CGStyleClamPizza box"
  end

end
