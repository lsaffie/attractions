class ChangePricesToFloat < ActiveRecord::Migration
  def self.up
    change_column :attractions, :price_children, :float
	  change_column :attractions, :price_adult, :float
		change_column :attractions, :price_senior, :float
		change_column :attraction_line_items, :attraction_price, :float
		change_column :attraction_orders, :total_price, :float
		change_column :attraction_carts, :price, :float
  end

  def self.down
  end
end
