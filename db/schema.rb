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

ActiveRecord::Schema.define(version: 20161128111342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "sender_type"
    t.integer  "recipient_type"
    t.text     "last_message_text"
    t.boolean  "is_read",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id", "recipient_type"], name: "index_conversations_on_recipient_id_and_recipient_type", using: :btree
  add_index "conversations", ["sender_id", "sender_type"], name: "index_conversations_on_sender_id_and_sender_type", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string    "name"
    t.integer   "teacher_id",                  null: false
    t.boolean   "status",       default: true, null: false
    t.datetime  "created_at",                  null: false
    t.datetime  "updated_at",                  null: false
    t.int4range "grade"
    t.string    "subject_area"
    t.string    "details"
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree

  create_table "guardians", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_photo_url"
  end

  add_index "guardians", ["user_id"], name: "index_guardians_on_user_id", unique: true, using: :btree

  create_table "mailboxes", force: :cascade do |t|
    t.integer  "mail_from",                  null: false
    t.integer  "mail_to",                    null: false
    t.string   "to_email",                   null: false
    t.datetime "end_date"
    t.string   "subject"
    t.string   "topics"
    t.text     "message"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_read",    default: false
    t.integer  "parent_id",  default: 0
    t.string   "usertype"
  end

  add_index "mailboxes", ["mail_from"], name: "index_mailboxes_on_mail_from", using: :btree
  add_index "mailboxes", ["mail_to"], name: "index_mailboxes_on_mail_to", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.text     "message"
    t.string   "attachment_url"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_type"
    t.integer  "conversation_id"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.string   "topic",      null: false
    t.date     "startdate",  null: false
    t.date     "enddate",    null: false
    t.time     "starttime",  null: false
    t.time     "endtime",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
  end

  add_index "schedules", ["course_id"], name: "index_schedules_on_course_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_photo_url"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", unique: true, using: :btree

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_photo_url"
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "usertype"
    t.date     "dob"
    t.integer  "total_score"
    t.string   "profile_photo"
    t.string   "languages"
    t.string   "activities"
    t.string   "videos"
    t.integer  "favourite_class"
    t.string   "study_groups"
    t.string   "awards"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "google"
    t.string   "pininterest"
    t.string   "mailbox"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "conversations", "users", column: "recipient_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "guardians", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "schedules", "courses"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
end
