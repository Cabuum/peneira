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

ActiveRecord::Schema.define(version: 20141230043119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "city",       limit: 200
    t.string   "state",      limit: 35
    t.string   "country",    limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "athletes", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "birthday"
    t.float    "height"
    t.float    "weight"
    t.boolean  "allow_to_travel"
    t.integer  "foot_id"
    t.integer  "position_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "athletes", ["foot_id"], name: "index_athletes_on_foot_id", using: :btree
  add_index "athletes", ["position_id"], name: "index_athletes_on_position_id", using: :btree
  add_index "athletes", ["user_id"], name: "index_athletes_on_user_id", using: :btree

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 20
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "username",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.date     "founded"
    t.integer  "address_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "clubs", ["address_id"], name: "index_clubs_on_address_id", using: :btree

  create_table "foots", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.boolean  "share_email"
    t.boolean  "share_phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "scouts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scouts", ["club_id"], name: "index_scouts_on_club_id", using: :btree
  add_index "scouts", ["user_id"], name: "index_scouts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                   limit: 30
    t.string   "last_name",              limit: 30
    t.string   "phone",                  limit: 14
    t.text     "bio"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "preference_id"
    t.string   "user_type",              limit: 7
    t.string   "unconfirmed_email"
    t.string   "image"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["preference_id"], name: "index_users_on_preference_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "athletes", "foots"
  add_foreign_key "athletes", "positions"
  add_foreign_key "athletes", "users"
  add_foreign_key "clubs", "addresses"
  add_foreign_key "scouts", "clubs"
  add_foreign_key "scouts", "users"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "preferences"
end
