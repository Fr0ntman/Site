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

ActiveRecord::Schema.define(version: 20160406170431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "title",                null: false
    t.string   "bg_img",               null: false
    t.string   "color"
    t.text     "description",          null: false
    t.string   "number",               null: false
    t.string   "level",                null: false
    t.string   "original_course_link", null: false
    t.string   "teacher",              null: false
    t.string   "category",             null: false
    t.string   "sub_category",         null: false
    t.string   "speciality"
    t.datetime "created_date",         null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "number",     null: false
    t.string   "title",      null: false
    t.json     "exams",      null: false
    t.json     "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exams", ["course_id"], name: "index_exams_on_course_id", using: :btree

  create_table "lectures", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "number"
    t.string   "video"
    t.string   "audio"
    t.string   "materials"
    t.string   "slides"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vk_post_id"
    t.json     "attachments"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title",      null: false
    t.integer  "number",     null: false
    t.json     "tasks",      null: false
    t.json     "solutions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["course_id"], name: "index_tasks_on_course_id", using: :btree

end
