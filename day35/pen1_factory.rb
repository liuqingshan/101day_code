require_relative "pen/circle_pen"
require_relative "pen/square_pen"

class Pen1Factory

  def create_pen(type)
    if type == "circle"
      CirclePen.new
    else
      SquarePen.new
    end
  end
end
