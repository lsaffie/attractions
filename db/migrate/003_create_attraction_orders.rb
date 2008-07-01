class CreateAttractionOrders < ActiveRecord::Migration
  def self.up
    create_table :attraction_orders do |t|
			t.column :guest_name, :string
			t.column :room_number, :string
			t.column :arrival_date, :string
			t.column :order_status, :string
			t.column :confirmation_number, :string
			t.column :telephone, :string
			t.column :email, :string
			t.column :created_on, :date
			t.column :total_price, :integer, :default => 0
			t.column :updated_by, :string
    end
  end

  def self.down
    drop_table :attraction_orders
  end
end
