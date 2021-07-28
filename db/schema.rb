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

ActiveRecord::Schema.define(version: 2020_03_10_173423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courier_packages", force: :cascade do |t|
    t.bigint "courier_id"
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courier_id"], name: "index_courier_packages_on_courier_id"
    t.index ["package_id"], name: "index_courier_packages_on_package_id"
  end

  create_table "couriers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "tracking_number", null: false
    t.boolean "delivery_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courier_packages", "couriers"
  add_foreign_key "courier_packages", "packages"
end
