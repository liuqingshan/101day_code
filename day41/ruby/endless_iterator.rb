class EndlessIterator
   include Enumerable

   def initialize
      @arr = [1,2,3,4]
      @index = 0
   end

   def each
      loop do
        yield @arr[@index]
        @index = (@index + 1) % @arr.size
      end
   end
end

endless = EndlessIterator.new

for e in endless do
   puts e
end
