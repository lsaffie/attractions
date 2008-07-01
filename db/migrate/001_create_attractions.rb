class CreateAttractions < ActiveRecord::Migration
  def self.up
    create_table :attractions do |t|
			t.column :name, :string
			t.column :additional_info, :text
			t.column :picture, :string
			t.column :map_link, :text
			t.column :links, :text
			t.column :price_children, :integer
			t.column :price_adult, :integer
			t.column :price_senior, :integer
			
			#image upload fields
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
			
    end
  end

  def self.down
    drop_table :attractions
  end
end
