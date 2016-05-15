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

ActiveRecord::Schema.define(version: 20160407202027) do

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",               null: false
    t.string   "commentable_type",             null: false
    t.integer  "author_id",                    null: false
    t.string   "body",                         null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "count",            default: 0
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id"
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"

  create_table "moderator_subs", force: :cascade do |t|
    t.integer  "moderator_id", null: false
    t.integer  "sub_id",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "moderator_subs", ["moderator_id"], name: "index_moderator_subs_on_moderator_id"
  add_index "moderator_subs", ["sub_id"], name: "index_moderator_subs_on_sub_id"

  create_table "post_subs", force: :cascade do |t|
    t.integer  "sub_id",     null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_subs", ["post_id"], name: "index_post_subs_on_post_id"
  add_index "post_subs", ["sub_id"], name: "index_post_subs_on_sub_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.integer  "sub_id"
    t.integer  "author_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "count",      default: 0
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"
  add_index "posts", ["sub_id"], name: "index_posts_on_sub_id"

  create_table "subs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
    t.boolean  "super_admin",     default: false
  end

  add_index "users", ["username"], name: "index_users_on_username"

  create_table "votes", force: :cascade do |t|
    t.integer  "voteable_id",               null: false
    t.string   "voteable_type",             null: false
    t.integer  "user_id",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "value",         default: 0
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id"
  add_index "votes", ["voteable_id"], name: "index_votes_on_voteable_id"

end
