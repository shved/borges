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

ActiveRecord::Schema.define(version: 20160805224927) do

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
    t.index ["login", "email"], name: "index_authors_on_login_and_email", using: :btree
    t.index ["reset_password_token"], name: "index_authors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "game_id"
    t.text     "text"
    t.jsonb    "props"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "game_id"], name: "index_game_sessions_on_author_id_and_game_id", using: :btree
    t.index ["author_id"], name: "index_game_sessions_on_author_id", using: :btree
    t.index ["game_id"], name: "index_game_sessions_on_game_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string  "name_ru"
    t.string  "name_en"
    t.jsonb   "props"
    t.string  "game_type"
    t.text    "desc_ru"
    t.text    "desc_en"
    t.integer "position",  default: 0, null: false
    t.index ["position"], name: "index_games_on_position", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "game_session_id"
    t.integer  "author_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["author_id", "game_session_id"], name: "index_likes_on_author_id_and_game_session_id", using: :btree
    t.index ["author_id"], name: "index_likes_on_author_id", using: :btree
    t.index ["game_session_id"], name: "index_likes_on_game_session_id", using: :btree
  end

  create_table "pending_game_sessions", force: :cascade do |t|
    t.integer  "game_id"
    t.text     "text"
    t.jsonb    "props"
    t.string   "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_pending_game_sessions_on_game_id", using: :btree
  end

  create_table "theme_suggestions", force: :cascade do |t|
    t.text  "text_ru"
    t.text  "text_en"
    t.jsonb "game_types"
  end

  add_foreign_key "game_sessions", "authors"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "likes", "authors"
  add_foreign_key "likes", "game_sessions"
  add_foreign_key "pending_game_sessions", "games"
end
