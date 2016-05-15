require_relative "formatter"

class SuperTextFormatter < Formatter
  def initialize(formatter)
    @formatter = formatter
  end

  def format
    "==== #{@formatter.format} ===="
  end
end