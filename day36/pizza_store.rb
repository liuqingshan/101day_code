class PizzaStore
   def order_pizza(type)
     pizza = create_pizza(type)
     pizza.prepare
     pizza.bake
     pizza.cut
     pizza.box
     pizza
   end

   def create_pizza(type)
     raise "Not Implement!"
   end
end
