class CreateAttractionCarts < ActiveRecord::Migration
  def self.up
    create_table :attraction_carts do |t|
			t.column :attraction_name, :string
			t.column :quantity, :integer
			t.column :price, :integer
    end
  end

  def self.down
    drop_table :attraction_carts
  end
end
