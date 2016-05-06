require_relative "subjectable"

class Weather
  include Subjectable

  def temp
    10
  end

  def humidity
    20
  end

  def pressure
    100
  end
end
