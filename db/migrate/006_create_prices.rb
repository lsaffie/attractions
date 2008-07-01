class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.column :attraction_id, :integer
      t.column :price_children, :integer
			t.column :price_adult, :integer
			t.column :price_senior, :integer
    end
  end

  def self.down
    drop_table :prices
  end
end
