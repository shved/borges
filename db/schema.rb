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

ActiveRecord::Schema.define(version: 20160528085324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_authors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_authors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "game_results", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "game_id"
    t.jsonb    "body"
    t.jsonb    "props"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_game_results_on_author_id", using: :btree
    t.index ["game_id"], name: "index_game_results_on_game_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string "name_ru"
    t.string "name_en"
    t.jsonb  "props"
    t.string "game_type"
  end

  add_foreign_key "game_results", "authors"
  add_foreign_key "game_results", "games"
end
