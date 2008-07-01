# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 10) do

  create_table "attraction_carts", :force => true do |t|
    t.column "attraction_name", :string
    t.column "quantity",        :integer
    t.column "price",           :integer
  end

  create_table "attraction_line_items", :force => true do |t|
    t.column "attraction_id",       :integer
    t.column "attraction_order_id", :integer
    t.column "attraction_name",     :string
    t.column "attraction_price",    :integer
    t.column "attraction_quantity", :integer
  end

  create_table "attraction_orders", :force => true do |t|
    t.column "guest_name",          :string
    t.column "room_number",         :string
    t.column "arrival_date",        :string
    t.column "order_status",        :string,   :default => "Incomplete"
    t.column "confirmation_number", :string
    t.column "telephone",           :string
    t.column "email",               :string
    t.column "created_on",          :date
    t.column "total_price",         :integer,  :default => 0
    t.column "updated_by",          :string
    t.column "updated_on",          :datetime
  end

  create_table "attractions", :force => true do |t|
    t.column "name",            :string
    t.column "additional_info", :text
    t.column "picture",         :string
    t.column "map_link",        :text
    t.column "links",           :text
    t.column "price_children",  :integer
    t.column "price_adult",     :integer
    t.column "price_senior",    :integer
    t.column "parent_id",       :integer
    t.column "content_type",    :string
    t.column "filename",        :string
    t.column "thumbnail",       :string
    t.column "size",            :integer
    t.column "width",           :integer
    t.column "height",          :integer
  end

  create_table "cart_items", :force => true do |t|
  end

  create_table "prices", :force => true do |t|
    t.column "attraction_id",  :integer
    t.column "price_children", :integer
    t.column "price_adult",    :integer
    t.column "price_senior",   :integer
  end

  create_table "users", :force => true do |t|
    t.column "login",                     :string
    t.column "email",                     :string
    t.column "crypted_password",          :string,   :limit => 40
    t.column "salt",                      :string,   :limit => 40
    t.column "created_at",                :datetime
    t.column "updated_at",                :datetime
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
  end

end