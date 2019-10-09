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

ActiveRecord::Schema.define(version: 2019_10_09_153816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_author_mappings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_book_author_mappings_on_author_id"
    t.index ["book_id"], name: "index_book_author_mappings_on_book_id"
  end

  create_table "book_hold_requests", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "book_id", null: false
    t.bigint "library_id", null: false
    t.integer "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_hold_requests_on_book_id"
    t.index ["library_id"], name: "index_book_hold_requests_on_library_id"
    t.index ["student_id"], name: "index_book_hold_requests_on_student_id"
  end

  create_table "book_library_mappings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_library_mappings_on_book_id"
    t.index ["library_id"], name: "index_book_library_mappings_on_library_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.string "language"
    t.string "published"
    t.string "edition"
    t.string "image"
    t.text "subject"
    t.text "summary"
    t.boolean "special"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "borrowing_histories", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "book_id", null: false
    t.boolean "active"
    t.date "issue_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_borrowing_histories_on_book_id"
    t.index ["student_id"], name: "index_borrowing_histories_on_student_id"
  end

  create_table "librarians", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.bigint "library_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "approved"
    t.index ["email"], name: "index_librarians_on_email", unique: true
    t.index ["library_id"], name: "index_librarians_on_library_id"
    t.index ["reset_password_token"], name: "index_librarians_on_reset_password_token", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.text "location"
    t.integer "max_days_blocking"
    t.integer "overdue_fines"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "university_id"
    t.index ["university_id"], name: "index_libraries_on_university_id"
  end

  create_table "student_bookmarks", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_student_bookmarks_on_book_id"
    t.index ["student_id"], name: "index_student_bookmarks_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.integer "educational_level"
    t.bigint "university_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_students_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "book_author_mappings", "authors"
  add_foreign_key "book_author_mappings", "books"
  add_foreign_key "book_hold_requests", "books"
  add_foreign_key "book_hold_requests", "libraries"
  add_foreign_key "book_hold_requests", "students"
  add_foreign_key "book_library_mappings", "books"
  add_foreign_key "book_library_mappings", "libraries"
  add_foreign_key "borrowing_histories", "books"
  add_foreign_key "borrowing_histories", "students"
  add_foreign_key "librarians", "libraries"
  add_foreign_key "libraries", "universities"
  add_foreign_key "student_bookmarks", "books"
  add_foreign_key "student_bookmarks", "students"
  add_foreign_key "students", "universities"
end
