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

ActiveRecord::Schema.define(:version => 20130104222358) do

  create_table "beer_categories", :force => true do |t|
    t.string "name", :limit => 20
  end

  create_table "beer_styles", :force => true do |t|
    t.integer "cat_id"
    t.string  "name",   :limit => 20
  end

  create_table "beers", :force => true do |t|
    t.integer  "brewery_id"
    t.string   "name",       :limit => 500
    t.integer  "cat_id"
    t.integer  "style_id"
    t.integer  "abv"
    t.text     "desc"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "breweries", :force => true do |t|
    t.string   "name",       :limit => 500
    t.string   "address1",   :limit => 500
    t.string   "address2",   :limit => 500
    t.string   "city",       :limit => 50
    t.string   "state",      :limit => 50
    t.integer  "code"
    t.string   "country",    :limit => 50
    t.string   "phone",      :limit => 50
    t.string   "website",    :limit => 500
    t.text     "desc"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "breweries_geocode", :force => true do |t|
    t.integer  "brewery_id"
    t.float    "lattitude"
    t.float    "longitude"
    t.string   "accuracy",   :limit => 20
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name",        :limit => 200
    t.string   "address",     :limit => 500
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "bar_type",    :limit => 50
    t.string   "subtype",     :limit => 50
    t.text     "description"
    t.string   "icon",        :limit => 100
    t.string   "phone",       :limit => 50
    t.string   "web",         :limit => 50
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
