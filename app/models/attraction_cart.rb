class AttractionCart 
	attr_reader :items
	attr_reader :total_price
	
	def initialize
		@items = []
		@total_price = 0.0
	end
	
	def add_attraction(attraction,count,price,type)
	  attraction.name+=' ' +type
		current_item = @items.find {|item| item.attraction.name == attraction.name}
  	if current_item
  		current_item.increment_quantity(count,price)
  	else
  	  @items << CartItem.new(attraction,count,price) 
  	end
  end
	
	def total_price
		@items.sum { |item| item.price }
	end	
	
end
