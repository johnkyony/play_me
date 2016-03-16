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

ActiveRecord::Schema.define(version: 20160316152645) do

  create_table "guests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["party_id"], name: "index_guests_on_party_id"
  add_index "guests", ["user_id"], name: "index_guests_on_user_id"

  create_table "invitations", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "invitations", ["party_id"], name: "index_invitations_on_party_id"
  add_index "invitations", ["receiver_id"], name: "index_invitations_on_receiver_id"
  add_index "invitations", ["sender_id"], name: "index_invitations_on_sender_id"

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "location"
    t.datetime "occurence"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parties", ["user_id"], name: "index_parties_on_user_id"

  create_table "playlists", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "party_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "playlists", ["party_id"], name: "index_playlists_on_party_id"
  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"
  add_index "playlists", ["video_id"], name: "index_playlists_on_video_id"

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.string   "artist"
    t.integer  "length"
    t.integer  "soundcloud_id"
    t.string   "stream_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "link"
    t.string   "uid"
    t.string   "title"
    t.integer  "voteup"
    t.integer  "votedown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
