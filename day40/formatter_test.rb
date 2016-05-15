require "test/unit"

require_relative "text_formatter"
require_relative "super_text_formatter"
require_relative "html_formatter"
require_relative "super_html_formatter"

class FormatterTest < Test::Unit::TestCase

  def test_format
    text_formatter = TextFormatter.new("hello")
    super_text_formatter = SuperTextFormatter.new(text_formatter)
    puts super_text_formatter.format

    html_formatter = HTMLFormatter.new("hello")
    super_html_formatter = SuperHTMLFormatter.new(html_formatter)
    puts super_html_formatter.format
  end
end