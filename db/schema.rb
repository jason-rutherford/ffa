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

ActiveRecord::Schema.define(version: 20160912045658) do

  create_table "nfl_byes", force: :cascade do |t|
    t.string   "team"
    t.integer  "bye_week"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "nfl_players", force: :cascade do |t|
    t.string   "ffn_id"
    t.boolean  "active"
    t.integer  "jersey"
    t.string   "lname"
    t.string   "fname"
    t.string   "display_name"
    t.string   "team"
    t.string   "position"
    t.string   "height"
    t.string   "weight"
    t.date     "dob"
    t.string   "college"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "nfl_schedules", force: :cascade do |t|
    t.integer  "game_week"
    t.date     "game_date"
    t.string   "away_team"
    t.string   "home_team"
    t.string   "game_time_et"
    t.string   "tv_station"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "nfl_teams", force: :cascade do |t|
    t.string   "code"
    t.string   "full_name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nfl_weathers", force: :cascade do |t|
    t.integer  "game_week"
    t.date     "game_date"
    t.string   "home_team"
    t.string   "away_team"
    t.string   "stadium"
    t.string   "is_dome"
    t.string   "geo_lat"
    t.string   "geo_long"
    t.string   "low"
    t.string   "high"
    t.string   "forecast"
    t.string   "wind_chill"
    t.string   "wind_speed"
    t.string   "dome_img"
    t.string   "small_img"
    t.string   "medium_img"
    t.string   "large_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
