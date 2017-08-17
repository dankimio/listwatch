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

ActiveRecord::Schema.define(version: 20170817204424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "movies_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "posters_cache", default: [], array: true
    t.boolean "descending", default: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.text "description"
    t.string "tmdb_poster_path"
    t.string "director"
    t.date "release_date"
    t.float "tmdb_rating"
    t.string "trailer_youtube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imdb_id"], name: "index_movies_on_imdb_id", unique: true
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id", unique: true
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "movie_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id", "movie_id"], name: "index_positions_on_list_id_and_movie_id", unique: true
    t.index ["list_id"], name: "index_positions_on_list_id"
    t.index ["movie_id"], name: "index_positions_on_movie_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["user_id", "movie_id"], name: "index_ratings_on_user_id_and_movie_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "positions", "lists"
  add_foreign_key "positions", "movies"
  add_foreign_key "ratings", "movies"
  add_foreign_key "ratings", "users"
end
