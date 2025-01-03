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

ActiveRecord::Schema.define(version: 2020_08_28_083205) do

  create_table "banks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "repayment_date"
    t.integer "billing_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_card_records", force: :cascade do |t|
    t.integer "credit_card_id"
    t.integer "repayment_record_id"
    t.integer "currency_id"
    t.float "amount"
    t.date "credit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_credit_card_records_on_credit_card_id"
    t.index ["currency_id"], name: "index_credit_card_records_on_currency_id"
    t.index ["repayment_record_id"], name: "index_credit_card_records_on_repayment_record_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "bank_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_credit_cards_on_bank_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repayment_records", force: :cascade do |t|
    t.float "total_amount"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
  end

  create_table "settings", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "domain_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
