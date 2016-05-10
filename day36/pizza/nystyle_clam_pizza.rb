require_relative "../pizza"

class NYStyleClamPizza < Pizza

  def prepare
    puts "NYStyleClamPizza ready"
  end

  def bake
    puts "NYStyleClamPizza bake"
  end

  def cut
    puts "NYStyleClamPizza bake"
  end

  def box
    puts "NYStyleClamPizza box"
  end

end
