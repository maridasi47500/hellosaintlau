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

ActiveRecord::Schema.define(version: 2022_04_30_024736) do

  create_table "cards", force: :cascade do |t|
    t.integer "img"
    t.string "name"
    t.string "email"
    t.string "femail"
    t.text "message"
    t.boolean "scopy"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventhaveeventtypes", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_type_id"
  end

  create_table "eventhavephotos", force: :cascade do |t|
    t.integer "event_id"
    t.integer "photo_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "place"
    t.date "begin"
    t.date "end"
    t.time "begintime"
    t.time "endtime"
    t.date "otherdate"
    t.string "telephone"
    t.string "email"
    t.string "other"
    t.string "tarifs"
    t.string "complementtarifs"
  end

  create_table "hotel_services", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotel_types", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotelhavehotelservices", force: :cascade do |t|
    t.integer "hotel_service_id"
    t.integer "hotel_id"
  end

  create_table "hotelhavehoteltypes", force: :cascade do |t|
    t.integer "hotel_type_id"
    t.integer "hotel_id"
  end

  create_table "hotelhavelocations", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "location_id"
  end

  create_table "hotelhavepayments", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotelshaveprices", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "price_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "event_id"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "email"
    t.string "telephone"
    t.string "adresse"
    t.string "zip"
    t.string "city"
    t.string "country"
    t.string "message_type"
    t.text "content"
    t.boolean "receiveupdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurant_services", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurant_types", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restauranthavecuisines", force: :cascade do |t|
    t.integer "cuisine_id"
    t.integer "restaurant_id"
  end

  create_table "restauranthavelocations", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "location_id"
  end

  create_table "restauranthavepayments", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "restaurant_id"
  end

  create_table "restauranthaverestaurantservices", force: :cascade do |t|
    t.integer "restaurant_service_id"
    t.integer "restaurant_id"
  end

  create_table "restauranthaverestauranttypes", force: :cascade do |t|
    t.integer "restaurant_type_id"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
