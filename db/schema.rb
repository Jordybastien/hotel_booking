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

ActiveRecord::Schema[7.0].define(version: 2024_03_07_213703) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "price_per_room"
    t.index ["city"], name: "index_hotels_on_city"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.date "arrival_date", null: false
    t.date "departure_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_paid", default: false
  end

  create_table "room_reservations", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_room_reservations_on_reservation_id"
    t.index ["room_id"], name: "index_room_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room_type"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "room_reservations", "reservations"
  add_foreign_key "room_reservations", "rooms"
  add_foreign_key "rooms", "hotels"
end
