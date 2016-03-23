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

ActiveRecord::Schema.define(version: 20160323074653) do

  create_table "jigyoshos", force: :cascade do |t|
    t.string   "cd",         limit: 10,             null: false
    t.string   "name",       limit: 60,             null: false
    t.string   "ryakusho",   limit: 30,             null: false
    t.integer  "from_ymd",   limit: 8,              null: false
    t.integer  "to_ymd",     limit: 8
    t.string   "mail",       limit: 50
    t.integer  "sort_num",   limit: 10
    t.integer  "flg",                   default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
