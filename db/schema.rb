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

ActiveRecord::Schema.define(version: 20160311031912) do

  create_table "comments", force: :cascade do |t|
    t.text     "comment",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "file_uploads", force: :cascade do |t|
    t.string   "file_name",   limit: 255
    t.datetime "uploaded_at"
    t.string   "description", limit: 255
    t.string   "file_type",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "file_versions", force: :cascade do |t|
    t.integer  "file_upload_id", limit: 4
    t.integer  "file_version",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "file_type",      limit: 255
  end

  add_index "file_versions", ["file_upload_id"], name: "index_file_versions_on_file_upload_id", using: :btree

  add_foreign_key "file_versions", "file_uploads"
end
