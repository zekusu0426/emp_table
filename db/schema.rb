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

ActiveRecord::Schema.define(version: 20160324074939) do

  create_table "jigyoshos", force: :cascade do |t|
    t.string   "cd",         limit: 10,             null: false
    t.string   "name",       limit: 60,             null: false
    t.string   "ryakusho",   limit: 30,             null: false
    t.integer  "from_ymd",   limit: 8,              null: false
    t.integer  "to_ymd",     limit: 8
    t.string   "mail",       limit: 50
    t.integer  "sort_num",   limit: 10
    t.integer  "flg",                   default: 1, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "emp_id",      limit: 8,               null: false
    t.string   "name",                                null: false
    t.string   "jigyosho_id"
    t.integer  "birthday",    limit: 8,               null: false
    t.string   "phone1"
    t.string   "phone2"
    t.string   "zip",         limit: 8,               null: false
    t.string   "address"
    t.string   "other",       limit: 100
    t.integer  "flg",                     default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
