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

ActiveRecord::Schema.define(version: 20180715064127) do

  create_table "fruits", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "fruit_name",         limit: 255
    t.string   "fruit_address1",     limit: 255
    t.string   "fruit_address2",     limit: 255
    t.string   "fruit_address3",     limit: 255
    t.text     "fruit_detail",       limit: 65535
    t.string   "harvest_season",     limit: 255
    t.string   "harvest_people",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.string   "photo",              limit: 255
  end

  create_table "governments", force: :cascade do |t|
    t.string   "organ_id",   limit: 255
    t.string   "prefecture", limit: 255
    t.string   "hall",       limit: 255
    t.string   "hall_email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "harvests", force: :cascade do |t|
    t.integer  "fruit_id",       limit: 4
    t.datetime "harvest_day"
    t.integer  "people_number",  limit: 4
    t.string   "fruit_quantity", limit: 255
    t.integer  "fruit_price",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",        limit: 4
    t.integer  "members_count",  limit: 4,   default: 0
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "harvest_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "join",       limit: 255
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "tree_id",    limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "harvest_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "review",     limit: 65535
    t.integer  "rate",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trees", force: :cascade do |t|
    t.string   "organ_id",      limit: 255
    t.string   "tree_type",     limit: 255
    t.string   "tree_name",     limit: 255
    t.string   "tree_address1", limit: 255
    t.string   "tree_address2", limit: 255
    t.integer  "tree_lat",      limit: 4
    t.integer  "tree_lon",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "address1",               limit: 255
    t.string   "address2",               limit: 255
    t.string   "address3",               limit: 255
    t.string   "nickname",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
