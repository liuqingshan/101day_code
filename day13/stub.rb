require "minitest/autorun"
require 'mocha/mini_test'

require 'bundler'
Bundler.require(:default)

class Product
  attr_accessor :name
end

class ProductTest < MiniTest::Unit::TestCase

  def setup
    @product = Product.new
  end

  def test_stub
    @product.stub :name, "product_name" do
      assert @product.name == "product_name"
    end
  end

  def test_use_mocha
    Product.expects(:find).with(1).returns @product
    assert_equal @product, Product.find(1)

    arr = [10, 2, 8]
    Product.expects(:price_avg).with(arr).returns 10
    assert_equal 10, Product.price_avg(arr)

    Product.any_instance.stubs(:wow).returns :wow
    product = Product.new
    assert_equal :wow, product.wow
  end
end

