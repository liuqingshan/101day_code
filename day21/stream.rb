require "minitest/autorun"
require "digest"

class Stream
  def initialize(io = $stdin, chunk= 64*1024)
    @io, @chunk = io, chunk
  end

  def stream(&block)
    loop do
      start = Time.now
      data = @io.read(@chunk)
      return if data.nil?

      time = (Time.now - start).to_f

      arg_count = block.arity
      arg_list = [data]
     
      if arg_count == 2 || ~arg_count == 2
        arg_list << (Time.now - start).to_f
      end
      block.call(*arg_list)
    end
  end
end

class Support 
  def self.file_size(file)
    File.open(file) do |f|
      bytes = 0
      s = Stream.new(f)
      s.stream {|data| bytes += data.size }
      bytes
    end
  end

  def self.digest(file)
    File.open(file) do |f|
      sha = Digest::SHA256.new
      s = Stream.new(f)
      s.stream(&sha.method(:update))
      sha.hexdigest
    end
  end
end

class SteamTest < MiniTest::Unit::TestCase

   def setup
     @file_path = "./tmp.txt"
     File.open(@file_path, "wb") do |f|
      f.puts "HelloWorld"
     end
   end
   
   def teardown
     File.delete(@file_path)
   end
   
   def test_steam
    assert_equal 11, Support.file_size(@file_path)       
    assert_equal 64, Support.digest(@file_path).length        
   end
end


