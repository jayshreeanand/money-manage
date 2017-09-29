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

ActiveRecord::Schema.define(version: 20170929185329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "meta_info"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "user_id"
    t.string   "document_image"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["transaction_id"], name: "index_receipts_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_receipts_on_user_id", using: :btree
  end

  create_table "reminders", force: :cascade do |t|
    t.text     "description"
    t.integer  "kind"
    t.datetime "remind_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "transaction_id"
    t.index ["transaction_id"], name: "index_reminders_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_reminders_on_user_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "bank_account_id"
    t.float    "amount"
    t.float    "balance"
    t.integer  "kind"
    t.text     "description"
    t.string   "currency"
    t.string   "uid"
    t.string   "source"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "transacted_at"
    t.index ["bank_account_id"], name: "index_transactions_on_bank_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
