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

ActiveRecord::Schema[7.0].define(version: 2022_12_20_071322) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_details", force: :cascade do |t|
    t.decimal "product_price"
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "product_quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_details_on_cart_id"
    t.index ["product_id"], name: "index_cart_details_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "total_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "address", null: false
    t.text "secound_address"
    t.bigint "postal_code", null: false
    t.string "country", null: false
    t.bigint "phone_number", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_checkouts_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "product_price"
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "product_quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status", default: "pending "
    t.decimal "total_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_type"
    t.string "name_on_card"
    t.string "card_number"
    t.string "expiry_date"
    t.integer "security_code"
    t.bigint "order_id"
    t.bigint "checkout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkout_id"], name: "index_payments_on_checkout_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "product_photos", force: :cascade do |t|
    t.integer "product_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.integer "discount_percentage", default: 0
    t.integer "quantity_sold", default: 0
    t.string "company"
    t.string "categories", default: [], array: true
    t.string "product_types", default: [], array: true
    t.text "description"
    t.text "return_policy"
    t.text "citizen_policy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories"], name: "index_products_on_categories"
    t.index ["product_types"], name: "index_products_on_product_types"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
