require "minitest/autorun"

require 'bundler'
Bundler.require(:default)

class FakeTest < MiniTest::Unit::TestCase

  def test_fake
    body = "hello world"
    url = "http://www.test.com/test1"
    FakeWeb.register_uri(:get, url, body: body)

    assert_equal body, Net::HTTP.get(URI.parse(url))
  end
end

