# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_07_065706) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.text "body", default: "", null: false
    t.boolean "lock", default: false, null: false
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", default: "", null: false
    t.boolean "lock", default: false, null: false
    t.integer "user_id", null: false
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dialog_members", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "dialog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dialog_id"], name: "index_dialog_members_on_dialog_id"
    t.index ["member_id"], name: "index_dialog_members_on_member_id"
  end

  create_table "dialogs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "owner_id", null: false
    t.boolean "lock", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_dialogs_on_owner_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subscriber_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscriber_id"], name: "index_friendships_on_subscriber_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "likeable_id", null: false
    t.string "likeable_type", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body", default: "", null: false
    t.boolean "lock", default: false, null: false
    t.integer "sender_id", null: false
    t.integer "dialog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dialog_id"], name: "index_messages_on_dialog_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.boolean "is_main", default: false, null: false
    t.bigint "imageable_id", null: false
    t.string "imageable_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "status", default: "", null: false
    t.string "interests", default: "", null: false
    t.date "date_of_birth"
    t.boolean "lock", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users", column: "author_id"
  add_foreign_key "comments", "users"
  add_foreign_key "dialog_members", "dialogs"
  add_foreign_key "dialog_members", "users", column: "member_id"
  add_foreign_key "dialogs", "users", column: "owner_id"
  add_foreign_key "friendships", "users", column: "subscriber_id"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "dialogs"
  add_foreign_key "messages", "users", column: "sender_id"
end
