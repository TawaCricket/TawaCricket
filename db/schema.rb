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

ActiveRecord::Schema.define(version: 20140930023510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "member_id",  default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "question"
    t.boolean  "resolved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "img_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "juniors", force: true do |t|
    t.integer  "member_id",                  default: -1,    null: false
    t.integer  "season_id",                  default: -1,    null: false
    t.string   "first_name",                 default: "",    null: false
    t.string   "last_name",                  default: "",    null: false
    t.string   "address"
    t.string   "email"
    t.string   "gender"
    t.date     "dob"
    t.string   "school"
    t.integer  "grade_last_season"
    t.integer  "current_school_year"
    t.boolean  "girls_only",                 default: false
    t.boolean  "enrolled_in_current_season", default: true
    t.integer  "team_id",                    default: -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "phone"
    t.string   "mobile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "schools", force: true do |t|
    t.integer  "junior_id",  default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.integer  "year"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seniors", force: true do |t|
    t.integer  "member_id",  default: -1, null: false
    t.integer  "season_id",  default: -1
    t.string   "position"
    t.integer  "team_id",    default: -1
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "coach"
    t.integer  "age_group"
    t.boolean  "female_only"
    t.integer  "season_id",   default: -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", force: true do |t|
    t.integer  "junior_id"
    t.integer  "member_id"
    t.integer  "team_id",     default: -2
    t.string   "name"
    t.integer  "grade"
    t.string   "contact"
    t.string   "description"
    t.string   "email"
    t.integer  "season_id",   default: -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
