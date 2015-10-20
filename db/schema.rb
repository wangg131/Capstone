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

ActiveRecord::Schema.define(version: 20151020072707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text    "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.boolean "read",            default: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
    t.string   "house_type"
    t.text     "description"
    t.integer  "price"
    t.string   "neighborhood"
    t.integer  "rooms_available"
    t.integer  "total_roommates"
    t.string   "bathroom_type"
    t.string   "gender_preference"
    t.string   "date_available"
    t.string   "laundry"
    t.string   "parking"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.boolean  "smoking"
    t.integer  "user_id"
    t.text     "images"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "title"
    t.string   "house_type"
    t.text     "description"
    t.integer  "min_price"
    t.integer  "max_price"
    t.text     "neighborhoods"
    t.integer  "rooms_needed"
    t.integer  "max_roommates"
    t.string   "bathroom_type"
    t.string   "gender_preference"
    t.string   "date_needed"
    t.string   "parking"
    t.string   "laundry"
    t.boolean  "smoking"
    t.boolean  "cats"
    t.boolean  "dogs"
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
