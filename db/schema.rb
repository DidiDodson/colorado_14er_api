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

ActiveRecord::Schema.define(version: 2022_03_09_154254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fourteeners", force: :cascade do |t|
    t.string "english_name"
    t.string "arapahoe_name"
    t.string "arapahoe_translation"
    t.string "ute_name"
    t.string "ute_translation"
    t.integer "elevation"
    t.string "range"
    t.string "county"
    t.string "nearby_towns"
    t.string "hiking_routes"
    t.string "climate"
    t.string "geology"
    t.string "first_ascent"
    t.string "history"
    t.string "resources"
    t.string "image"
    t.string "map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
