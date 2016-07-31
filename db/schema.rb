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

ActiveRecord::Schema.define(version: 20160717161155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_categories", ["ancestry"], name: "index_course_categories_on_ancestry", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title",                null: false
    t.string   "bg_img",               null: false
    t.string   "color",                null: false
    t.text     "description",          null: false
    t.string   "number",               null: false
    t.string   "level",                null: false
    t.string   "original_course_link", null: false
    t.string   "teacher",              null: false
    t.string   "category",             null: false
    t.string   "sub_category",         null: false
    t.string   "speciality"
    t.datetime "date_of_creating",     null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "exam_files", force: :cascade do |t|
    t.integer  "exam_id"
    t.string   "ancestry"
    t.string   "title",      default: "Экзамен", null: false
    t.integer  "number",                         null: false
    t.string   "file",                           null: false
    t.integer  "year"
    t.string   "exam_type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "exam_files", ["ancestry"], name: "index_exam_files_on_ancestry", using: :btree
  add_index "exam_files", ["exam_id"], name: "index_exam_files_on_exam_id", using: :btree

  create_table "exams", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title",      default: "Экзамен"
    t.integer  "number",                         null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "exams", ["course_id"], name: "index_exams_on_course_id", using: :btree

  create_table "lectures", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title",                          null: false
    t.string   "type_title",  default: "Лекция"
    t.text     "description",                    null: false
    t.integer  "number",                         null: false
    t.string   "lecture",                        null: false
    t.string   "cover"
    t.string   "multimedia"
    t.string   "materials"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.integer  "lecture_id"
    t.string   "title",         null: false
    t.string   "file",          null: false
    t.string   "material_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "materials", ["lecture_id"], name: "index_materials_on_lecture_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vk_post_id"
    t.json     "attachments"
    t.string   "description"
    t.integer  "category_id"
    t.string   "source"
    t.boolean  "published"
  end

  create_table "news_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_files", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "ancestry"
    t.string   "title",      null: false
    t.integer  "number",     null: false
    t.string   "file",       null: false
    t.string   "task_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_files", ["ancestry"], name: "index_task_files_on_ancestry", using: :btree
  add_index "task_files", ["task_id"], name: "index_task_files_on_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "lecture_id"
    t.string   "title",      default: "Задание"
    t.integer  "number",                         null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tasks", ["lecture_id"], name: "index_tasks_on_lecture_id", using: :btree

  add_foreign_key "materials", "lectures"
end
