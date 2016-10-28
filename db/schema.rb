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

ActiveRecord::Schema.define(version: 20161028062119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacherid"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "courses", ["teacherid"], name: "index_courses_on_teacherid", using: :btree

  create_table "mailboxes", force: :cascade do |t|
    t.integer  "mail_from",  null: false
    t.integer  "mail_to",    null: false
    t.string   "to_email",   null: false
    t.datetime "end_date"
    t.string   "subject"
    t.string   "topics"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mailboxes", ["mail_from"], name: "index_mailboxes_on_mail_from", using: :btree
  add_index "mailboxes", ["mail_to"], name: "index_mailboxes_on_mail_to", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",                           null: false
    t.integer  "recipient_user_id",                 null: false
    t.integer  "parent_message_id", default: 0,     null: false
    t.text     "text",                              null: false
    t.boolean  "is_read",           default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "current_text"
  end

  add_index "messages", ["parent_message_id"], name: "index_messages_on_parent_message_id", using: :btree
  add_index "messages", ["recipient_user_id"], name: "index_messages_on_recipient_user_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

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
    t.string   "type"
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

  add_foreign_key "schedules", "courses"
end
