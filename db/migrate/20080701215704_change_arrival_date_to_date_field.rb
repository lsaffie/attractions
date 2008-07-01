class ChangeArrivalDateToDateField < ActiveRecord::Migration
  def self.up
    	change_column :attraction_orders, :arrival_date, :date
  end

  def self.down
  end
end
