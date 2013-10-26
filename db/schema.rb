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

ActiveRecord::Schema.define(version: 20131026062132) do

  create_table "answers", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.integer  "mentee_id"
    t.integer  "job_id"
    t.boolean  "confirm"
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["job_id"], name: "index_applications_on_job_id"
  add_index "applications", ["mentee_id"], name: "index_applications_on_mentee_id"

  create_table "banners", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "contents"
    t.string   "banner_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_urls", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "foreign_title"
    t.string   "first_category"
    t.string   "second_category"
    t.text     "authors",         limit: 255
    t.string   "main_author"
    t.string   "publisher"
    t.string   "published_at"
    t.string   "language"
    t.string   "size"
    t.string   "last_page"
    t.string   "isbn10"
    t.string   "isbn13"
    t.string   "price"
    t.string   "reviewed"
    t.text     "description",     limit: 255
    t.text     "index",           limit: 255
    t.string   "series"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["isbn13"], name: "index_books_on_isbn13"
  add_index "books", ["main_author"], name: "index_books_on_main_author"
  add_index "books", ["series"], name: "index_books_on_series"
  add_index "books", ["title"], name: "index_books_on_title"
  add_index "books", ["url"], name: "index_books_on_url"

  create_table "jobs", force: true do |t|
    t.integer  "mentor_id"
    t.string   "category"
    t.string   "title"
    t.string   "address"
    t.string   "location"
    t.string   "level"
    t.text     "contents"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "days"
    t.integer  "start_time"
    t.integer  "finish_time"
    t.integer  "working_time"
    t.integer  "learning_time"
    t.integer  "workers_count"
    t.integer  "pay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["mentor_id"], name: "index_jobs_on_mentor_id"

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "role_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "farm"
    t.string   "mentor_major"
    t.text     "mentor_guide"
    t.string   "baby_picture"
    t.string   "baby_name"
    t.text     "latlng"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
