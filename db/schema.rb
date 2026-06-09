# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_09_184152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.date "due_date"
    t.date "paid_at"
    t.string "payment_method"
    t.boolean "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "plans", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.integer "duration_days"
    t.string "name_plan", null: false
    t.decimal "price", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.string "name_student", null: false
    t.string "phone"
    t.bigint "plan_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["plan_id"], name: "index_students_on_plan_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "cpf", null: false
    t.datetime "created_at", null: false
    t.string "password_digest", null: false
    t.string "role", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "payments", "students"
  add_foreign_key "students", "plans"
  add_foreign_key "students", "users"
end
