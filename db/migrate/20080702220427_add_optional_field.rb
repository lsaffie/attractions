class AddOptionalField < ActiveRecord::Migration
  def self.up
    add_column :attractions, :optional_field_name, :string
    add_column :attractions, :optional_field_price, :float
  end

  def self.down
    remove_column :attractions, :optional_field_name
    remove_column :attractions, :optional_field_price
  end
end
