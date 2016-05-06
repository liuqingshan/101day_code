require_relative "current_conditions_display"
require_relative "forecast_display"
require_relative "weather"

weather = Weather.new

ccd = CurrentConditionsDisplay.new
fd = ForecastDisplay.new

weather.addObserver(ccd)
weather.addObserver(fd)

weather.notify

weather.removeObserver(fd)
weather.notify
