class Note
  attr_accessor :note

  def initialize(note = nil)
    @note = note
    puts "@note is #{@note}"
    puts yield(self) if block_given?
    puts "@note is #{@note}"
  end

  def self.create
    new(yield)
  end
end

Note.create { "Foo" }
puts "============="

Note.new("new")  do |n|
  n.note = "Hello"
end
