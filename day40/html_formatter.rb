require_relative "formatter"

class HTMLFormatter < Formatter

  def format
    "<strong>#{@str}</strong>"
  end
end