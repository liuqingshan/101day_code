require "minitest/autorun"
require 'mocha/mini_test'

require 'bundler'
Bundler.require(:default)

class Disk
  attr_accessor :song

  def initialize(song)
    @song = song
  end

  def play(n)
    n.times do
      @song.play(:fast)
    end
  end
end

class DiskTest < MiniTest::Unit::TestCase

  def test_disk
    song = mock()
    #song.stubs(:play).with(:fast).at_least_once
    song.stubs(:play).with(:fast).twice

    disk = Disk.new(song)
    disk.play(2)
  end
end

