require_relative "formatter"

class SuperHTMLFormatter < Formatter

  def initialize(formatter)
    @formatter = formatter
  end

  def format
    <<~EOF
      <html>
        <body>
          #{@formatter.format}
        </body>
      </html>
    EOF
  end

end