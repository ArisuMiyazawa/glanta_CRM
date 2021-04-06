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

ActiveRecord::Schema.define(version: 2021_04_01_102144) do

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.date "birthday"
    t.string "job"
    t.string "postcode"
    t.string "street_address"
    t.string "phone_number"
    t.string "email"
    t.string "line_id"
    t.string "allergy"
    t.string "introducer_name"
    t.string "request"
    t.boolean "consent"
    t.string "nail_technician_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "reservation_date"
    t.time "reservation_time"
    t.string "note"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
  end

  create_table "treatment_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "gel_used"
    t.integer "amount_of_money"
    t.string "treatment_menu"
    t.integer "remaining_number_of_pointcards"
    t.integer "remaining_number_of_stones"
    t.string "other"
    t.bigint "customer_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_treatment_records_on_customer_id"
    t.index ["reservation_id"], name: "index_treatment_records_on_reservation_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false, null: false
  end

  add_foreign_key "reservations", "customers"
  add_foreign_key "treatment_records", "customers"
  add_foreign_key "treatment_records", "reservations"
end
