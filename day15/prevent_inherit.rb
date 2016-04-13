module PreventInherit

  class InheritError < StandardError
  end

  def inherited(child)
    raise(InheritError, "#{child} cannot inherit from #{self}")
  end
end
