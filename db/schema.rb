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

ActiveRecord::Schema.define(version: 20140501104935) do

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.string   "commenter"
    t.integer  "swit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["swit_id"], name: "index_comments_on_swit_id"

  create_table "door_tags", force: true do |t|
    t.text     "doortag"
    t.integer  "swit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "door_tags", ["swit_id"], name: "index_door_tags_on_swit_id"

  create_table "sours", force: true do |t|
    t.string   "voter"
    t.integer  "swit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sours", ["swit_id"], name: "index_sours_on_swit_id"

  create_table "sweets", force: true do |t|
    t.string   "voter"
    t.integer  "swit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sweets", ["swit_id"], name: "index_sweets_on_swit_id"

  create_table "swits", force: true do |t|
    t.text     "text"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
