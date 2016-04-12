require "test/unit"

module Kernel
  def using(resource)
    yield(resource)
  ensure
    resource.close if resource && resource.respond_to?(:close)
  end
end

class Resource
  def close
    @close = true
  end

  def closed?
    @close
  end
end

class ResourceError < StandardError
end

class LockTest < Test::Unit::TestCase
  def setup
    @resource = Resource.new
  end

  def test_none_block
    using(@resource) {}
    assert @resource.closed?
  end

  def test_block
    assert_raise ResourceError do
      using(@resource) do
        raise ResourceError
      end
    end
    assert @resource.closed?
  end
end
