module Subjectable

  def addObserver(o)
    @__arr__ ||= []
    @__arr__.push(o) unless @__arr__.include? o
  end

  def removeObserver(o)
    @__arr__.delete(o) if @__arr__.include? o
  end

  def notify
    @__arr__.each do |c|
      c.respond_to?(:update) && c.update(self)
    end
  end
end
