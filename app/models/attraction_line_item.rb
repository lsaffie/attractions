class AttractionLineItem < ActiveRecord::Base
	belongs_to :attraction_order
	belongs_to :attraction
	
	def self.from_cart_item(cart_item)
    li= self.new
    li.attraction = cart_item.attraction
    li.attraction_name = cart_item.name
    li.attraction_quantity = cart_item.quantity
    li.attraction_price = cart_item.price
    li
  end
  	
end
