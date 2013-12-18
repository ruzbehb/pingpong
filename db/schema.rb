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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20131217180153) do
=======
ActiveRecord::Schema.define(version: 20131216163037) do
>>>>>>> e505277bfbc50317103303314cf754f5ea7cfaa5

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "address"
    t.string   "post_code"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "games", force: true do |t|
    t.integer  "score_id"
    t.integer  "points",     default: 0
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",  default: false
  end

  add_index "games", ["score_id"], name: "index_games_on_score_id", using: :btree

  create_table "matches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches_players", id: false, force: true do |t|
    t.integer "match_id",  null: false
    t.integer "player_id", null: false
  end

  create_table "players", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "image_url"
    t.text     "current_location"
    t.text     "hometown"
    t.text     "fb_url"
    t.string   "sex"
    t.text     "google_url"
    t.text     "address_line1"
    t.text     "address_line2"
    t.text     "city_town"
    t.text     "state"
    t.string   "post_code"
    t.string   "country"
    t.boolean  "guest",                  default: false
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "scores", force: true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "won_games",  default: 0
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id", using: :btree
  add_index "scores", ["player_id"], name: "index_scores_on_player_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
