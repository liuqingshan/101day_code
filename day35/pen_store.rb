class PenStore

   def initialize(factory)
     @factory = factory
   end

   def order_pen(type)
     pen = @factory.create_pen(type)
     pen.adjust
     pen.verify
     pen
   end
end
