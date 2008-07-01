class AddUpdatedOnAttractionOrders < ActiveRecord::Migration
  def self.up
    add_column :attraction_orders, :updated_on, :timestamp
  end

  def self.down
    remove_column :attraction_orders, :updated_on
  end
end
