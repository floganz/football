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

ActiveRecord::Schema.define(version: 20160714111121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "first_team_id"
    t.integer  "second_team_id"
    t.integer  "first_team_goals"
    t.integer  "second_team_goals"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "round_id"
  end

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
    t.string  "name"
    t.string  "surname"
    t.string  "email"
    t.string  "photo"
    t.integer "rang"
    t.string  "password"
  end

  create_table "votings", force: :cascade do |t|
    t.integer "vote_user_id"
    t.integer "user_id"
    t.integer "rank"
    t.integer "tournament_id"
  end

  add_foreign_key "matches", "rounds", column: "id", name: "round_id"
  add_foreign_key "matches", "teams", column: "id", name: "first_team_id"
  add_foreign_key "matches", "teams", column: "id", name: "second_team_id"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "teams", "users", column: "id", name: "first_user_id"
  add_foreign_key "teams", "users", column: "id", name: "second_user_id"
  add_foreign_key "votings", "tournaments", column: "id", name: "tournament_id"
  add_foreign_key "votings", "users", column: "id", name: "user_id"
  add_foreign_key "votings", "users", column: "id", name: "vote_user_id"
end
