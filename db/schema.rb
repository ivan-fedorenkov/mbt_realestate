# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130127091446) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "position",   :default => 0
  end

  add_index "articles", ["position"], :name => "index_articles_on_position"

  create_table "locations", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "locations", ["name"], :name => "index_locations_on_name", :unique => true

  create_table "lots", :force => true do |t|
    t.string   "title"
    t.string   "residential_type"
    t.boolean  "private_pool"
    t.boolean  "communal_pool"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "additional_features"
    t.float    "latitude",            :default => 0.0
    t.float    "longitude",           :default => 0.0
    t.integer  "distance_to_sea"
    t.boolean  "title_deed_ready"
    t.integer  "location_id"
    t.string   "type"
    t.integer  "price_from"
    t.integer  "price_to"
    t.integer  "plot_from"
    t.integer  "plot_to"
    t.integer  "bedrooms_from"
    t.integer  "bedrooms_to"
    t.integer  "baths_from"
    t.integer  "baths_to"
    t.integer  "covered_area_from"
    t.integer  "covered_area_to"
    t.integer  "opened_veranda_from"
    t.integer  "opened_veranda_to"
    t.integer  "levels_from"
    t.integer  "levels_to"
    t.integer  "parking_from"
    t.integer  "parking_to"
    t.boolean  "include_vat"
    t.text     "description"
  end

  add_index "lots", ["location_id"], :name => "index_residentials_on_location_id"

  create_table "pictures", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

end
