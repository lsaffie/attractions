class CreateAttractionLineItems < ActiveRecord::Migration
  def self.up
    create_table :attraction_line_items do |t|
			t.column :attraction_id, :integer
			t.column :attraction_order_id, :integer
			t.column :attraction_name, :string
			t.column :attraction_price, :integer
			t.column :attraction_quantity, :integer
    end
  end

  def self.down
    drop_table :attraction_line_items
  end
end
