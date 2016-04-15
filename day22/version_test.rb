require "minitest/autorun"
require "set"
require "./version.rb"

describe Version do
  describe "when parsing" do
    before do
      @version = Version.new("1.2.3")
    end  
    
    it "creates three integers" do
      @version.major.must_equal(1)
      @version.minor.must_equal(2)
      @version.patch.must_equal(3)
    end
  end

  describe "when comparing" do
    before do
      @v1 = Version.new("1.2.3")
      @v2 = Version.new("2.3.4")
    end
    
    it "orders correctly" do
      @v1.wont_equal(@v2)  
      @v1.must_be(:<, @v2)
    end
  end

  describe "when insert into set" do
    before do
      @v1 = Version.new("1.2.3")
      @v2 = Version.new("1.2.3")
    end   
    
    it "insert correctly" do
      set = Set.new [@v1, @v2]
      set.size.must_equal(1)
    end
  end
end
