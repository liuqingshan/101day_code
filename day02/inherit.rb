class C1
  def m1
    "C1.m1"
  end
end

module M1
  def m1
    "M1.m1"
  end
end

class CC1 < C1
  include M1

  def m1
    "CC1.m1"
  end
end

class CC2 < C1
  include M1
end

class CC3 < C1

end


