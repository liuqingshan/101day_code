require "minitest/autorun"

module OnlySpace
  ONLY_SPACE_UNICODE_RE = %r/\A[[:space:]]*\z/
  refine(String) do #refine string method
   def only_space?
    if ascii_only?
      !bytes.any? {|b| b != 32 && !b.between?(9, 13) }
    else
      ONLY_SPACE_UNICODE_RE === self
    end
   end
  end
end

class Person
  using(OnlySpace) #using refine string method 

  def initialize(name)
    @name = name
  end

  def valid?
    !@name.only_space?
  end
  
  def display(io = $stdout)
    io.puts(@name)
  end
end

class PersonTest < MiniTest::Unit::TestCase
  def test_person
    @person = Person.new("Jem")
    assert @person.valid?    

    @person = Person.new("\r\n")
    refute @person.valid?
  end
end
