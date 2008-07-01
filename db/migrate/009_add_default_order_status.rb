class AddDefaultOrderStatus < ActiveRecord::Migration
  def self.up
    change_column :attraction_orders, :order_status, :string, :default => 'Incomplete'
  end

  def self.down
    change_column :attraction_orders, :order_status, :string
  end
end
