class AttractionOrder < ActiveRecord::Base
  validates_presence_of :guest_name, :arrival_date, :confirmation_number, :telephone, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates_numericality_of :confirmation_number
  validates_length_of :confirmation_number, :is => 8, :message => "CONFIRMATION NUMBER MUST BE 8 CHARACTERS"
  validates_confirmation_of :email, :message => "EMAIL ADDRESSES MUST MATCH"
	has_many :attraction_line_items
	has_many :prices

	
	def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = AttractionLineItem.from_cart_item(item)
      attraction_line_items << li
    end
  end
    
  def set_total(order)
    #if order.total_price != 0
     # order.total_price = 0
    #end
    for item in order.attraction_line_items
      order.total_price += item.attraction_price
    end
  end
  
end
