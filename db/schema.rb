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

ActiveRecord::Schema.define(version: 2020_10_18_134859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "shop_name"
    t.string "work_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "staff_name"
    t.integer "price"
    t.index ["staff_id"], name: "index_events_on_staff_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "staff_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_likes_on_staff_id"
  end

  create_table "reports", force: :cascade do |t|
    t.date "worked_on"
    t.integer "ftth"
    t.integer "tab_new"
    t.integer "tab_change"
    t.integer "d_card_g"
    t.integer "d_card_r"
    t.integer "sls"
    t.integer "h4d"
    t.integer "skp"
    t.integer "reception"
    t.integer "hs"
    t.integer "mnp"
    t.integer "migration"
    t.bigint "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shop_name"
    t.index ["staff_id"], name: "index_reports_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "status"
    t.integer "price"
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

  add_foreign_key "events", "staffs"
  add_foreign_key "likes", "staffs"
  add_foreign_key "reports", "staffs"
end
