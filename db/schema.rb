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

ActiveRecord::Schema.define(version: 20220304170612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "data"
    t.integer  "user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string   "chat_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats_users", force: :cascade do |t|
    t.integer  "chat_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "c_user_id"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "msg_body",   null: false
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cur_user"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "senha"
    t.date     "idade"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "imgurl"
    t.boolean  "admin",      default: false, null: false
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "messages", "chats"
end
