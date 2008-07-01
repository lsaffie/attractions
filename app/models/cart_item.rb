class CartItem 
	
	attr_reader :attraction, :quantity
	
	def initialize(attraction,count,price)
		@attraction = attraction
		@quantity = count
		@price = price
	end
	
	def increment_quantity(count,price)
		@quantity += count
		@price = price
	end
	
	def name
		@attraction.name
	end
	
	def price
		@price * @quantity
	end
  
end
