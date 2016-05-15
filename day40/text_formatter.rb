require_relative "formatter"
class TextFormatter < Formatter

  def format
     "***#{@str}***"
  end
end