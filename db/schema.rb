# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080701215704) do

  create_table "attraction_carts", :force => true do |t|
    t.string  "attraction_name"
    t.integer "quantity"
    t.integer "price"
  end

  create_table "attraction_line_items", :force => true do |t|
    t.integer "attraction_id"
    t.integer "attraction_order_id"
    t.string  "attraction_name"
    t.integer "attraction_price"
    t.integer "attraction_quantity"
  end

  create_table "attraction_orders", :force => true do |t|
    t.string   "guest_name"
    t.string   "room_number"
    t.date     "arrival_date",        :limit => 255
    t.string   "order_status",                       :default => "Incomplete"
    t.string   "confirmation_number"
    t.string   "telephone"
    t.string   "email"
    t.date     "created_on"
    t.integer  "total_price",                        :default => 0
    t.string   "updated_by"
    t.datetime "updated_on"
  end

  create_table "attractions", :force => true do |t|
    t.string  "name"
    t.text    "additional_info"
    t.string  "picture"
    t.text    "map_link"
    t.text    "links"
    t.integer "price_children"
    t.integer "price_adult"
    t.integer "price_senior"
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "cart_items", :force => true do |t|
  end

  create_table "prices", :force => true do |t|
    t.integer "attraction_id"
    t.integer "price_children"
    t.integer "price_adult"
    t.integer "price_senior"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
