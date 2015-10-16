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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151016185815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "house_type"
    t.text     "description"
    t.integer  "price"
    t.string   "neighborhood"
    t.string   "lease_length"
    t.string   "date_available"
    t.string   "gender_preference"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.boolean  "smoking"
    t.string   "image"
    t.integer  "total_roommates"
    t.integer  "user_id"
    t.string   "parking"
    t.string   "laundry"
    t.integer  "rooms_available"
    t.string   "bathroom_type"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "title"
    t.string   "house_type"
    t.text     "neighborhoods"
    t.integer  "rooms_wanted"
    t.string   "bathroom_type"
    t.text     "description"
    t.integer  "min_price"
    t.integer  "max_price"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.string   "parking"
    t.string   "laundry"
    t.integer  "max_roommates"
    t.boolean  "smoking"
    t.string   "gender_preference"
    t.string   "date_needed"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "user_type"
    t.string   "country_code"
    t.string   "authy_id"
    t.boolean  "verified"
    t.integer  "post_id"
    t.integer  "profile_id"
  end

end
