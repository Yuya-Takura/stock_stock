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

ActiveRecord::Schema.define(version: 2019_02_07_105204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "settlements", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "stock_id", null: false
    t.string "stock_code", null: false
    t.integer "year", null: false
    t.integer "quarter", null: false
    t.float "eps", null: false
    t.float "expected_eps", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "date"], name: "index_settlements_on_stock_id_and_date", unique: true
  end

  create_table "stock_prices", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "stock_id", null: false
    t.string "stock_code", null: false
    t.float "open"
    t.float "close"
    t.float "highest"
    t.float "lowest"
    t.float "adjusted_close"
    t.integer "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "date"], name: "index_stock_prices_on_stock_id_and_date", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["code"], name: "index_stocks_on_code", unique: true
  end

  add_foreign_key "settlements", "stocks"
  add_foreign_key "stock_prices", "stocks"
end
