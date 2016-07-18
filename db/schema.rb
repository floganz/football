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

ActiveRecord::Schema.define(version: 20160718073819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "first_team_id"
    t.integer  "second_team_id"
    t.integer  "first_team_goals"
    t.integer  "second_team_goals"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "round_id"
  end

  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer "tournament_id"
    t.string  "name"
    t.string  "round_type"
    t.integer "order"
  end

  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer "first_user_id"
    t.integer "second_user_id"
    t.string  "name"
  end

  create_table "teams_tournaments", id: false, force: :cascade do |t|
    t.integer "team_id",       null: false
    t.integer "tournament_id", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "status"
  end

  create_table "tournaments_users", id: false, force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.integer "user_id",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "photo"
    t.integer  "rang"
    t.string   "password"
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votings", force: :cascade do |t|
    t.integer "vote_user_id"
    t.integer "user_id"
    t.integer "rank"
    t.integer "tournament_id"
  end

  add_index "votings", ["tournament_id"], name: "index_votings_on_tournament_id", using: :btree

  add_foreign_key "matches", "rounds"
  add_foreign_key "matches", "teams", column: "first_team_id"
  add_foreign_key "matches", "teams", column: "second_team_id"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "teams", "users", column: "first_user_id"
  add_foreign_key "teams", "users", column: "second_user_id"
  add_foreign_key "votings", "tournaments"
  add_foreign_key "votings", "users", name: "user_id"
  add_foreign_key "votings", "users", name: "vote_user_id"
end
