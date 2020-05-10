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

ActiveRecord::Schema.define(version: 20200510073732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_details", force: true do |t|
    t.integer  "bet_number"
    t.integer  "amount"
    t.datetime "betting_time"
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "bet_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bet_details", ["game_id"], name: "index_bet_details_on_game_id", using: :btree
  add_index "bet_details", ["user_id"], name: "index_bet_details_on_user_id", using: :btree

  create_table "casinos", force: true do |t|
    t.string   "name"
    t.integer  "balance_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealers", force: true do |t|
    t.string   "name"
    t.integer  "casino_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dealers", ["casino_id"], name: "index_dealers_on_casino_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "dealer_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status"
    t.integer  "thrown_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["dealer_id"], name: "index_games_on_dealer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "balance_amount"
    t.integer  "current_casino_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["current_casino_id"], name: "index_users_on_current_casino_id", using: :btree

end
