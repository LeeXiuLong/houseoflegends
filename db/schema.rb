# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_12_063949) do
  create_table "champions", force: :cascade do |t|
    t.string "champion_name"
    t.integer "api_champion_id"
    t.integer "games_played"
    t.integer "wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_champion_id"], name: "index_champions_on_api_champion_id", unique: true
    t.index ["champion_name"], name: "index_champions_on_champion_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_matches_on_match_id", unique: true
  end

  create_table "summoner_matches", force: :cascade do |t|
    t.integer "match_id"
    t.integer "summoner_id"
    t.integer "champion_id"
    t.boolean "win"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["champion_id"], name: "index_summoner_matches_on_champion_id"
    t.index ["summoner_id"], name: "index_summoner_matches_on_summoner_id"
  end

  create_table "summoners", force: :cascade do |t|
    t.string "summoner_name"
    t.string "discord_name"
    t.string "solo_rank"
    t.string "flex_rank"
    t.integer "games_played"
    t.integer "wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["summoner_name"], name: "index_summoners_on_summoner_name", unique: true
  end

  add_foreign_key "summoner_matches", "champions"
  add_foreign_key "summoner_matches", "summoners"
end
