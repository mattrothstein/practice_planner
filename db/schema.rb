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

ActiveRecord::Schema.define(version: 20161129081616) do

  create_table "drill_image_coordinates", force: :cascade do |t|
    t.integer  "drill_id"
    t.string   "x"
    t.string   "y"
    t.string   "marker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_drill_image_coordinates_on_drill_id"
  end

  create_table "drills", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.string   "sport"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drills_on_user_id"
  end

  create_table "practices", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "date"
    t.string   "name"
    t.text     "notes"
    t.integer  "length"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_practices_on_team_id"
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "slots", force: :cascade do |t|
    t.integer  "practice_id"
    t.integer  "length"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "drill_id"
    t.integer  "priority"
    t.index ["drill_id"], name: "index_slots_on_drill_id"
    t.index ["practice_id"], name: "index_slots_on_practice_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "sport"
    t.integer  "age"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
