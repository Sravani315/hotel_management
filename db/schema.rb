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

ActiveRecord::Schema.define(version: 2021_02_09_052850) do

  create_table "booking", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "customer_id"
    t.timestamp "check_in"
    t.timestamp "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_booking_on_customer_id"
    t.index ["room_id"], name: "index_booking_on_room_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "gender"
    t.string "ph_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "amount"
    t.string "currency"
    t.bigint "room_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_type_id"], name: "index_prices_on_room_type_id"
  end

  create_table "room_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_type_id"
    t.string "room_no"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  add_foreign_key "booking", "customers"
  add_foreign_key "booking", "rooms"
  add_foreign_key "prices", "room_types"
  add_foreign_key "rooms", "room_types"
end
