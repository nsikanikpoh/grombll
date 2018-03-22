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

ActiveRecord::Schema.define(version: 20180321153406) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catlevel1s", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_catlevel1s_on_category_id"
  end

  create_table "catlevel2s", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.integer "category_id"
    t.integer "catlevel1_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_catlevel2s_on_category_id"
    t.index ["catlevel1_id"], name: "index_catlevel2s_on_catlevel1_id"
  end

  create_table "catlevel3s", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.integer "category_id"
    t.integer "catlevel2_id"
    t.integer "catlevel1_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_catlevel3s_on_category_id"
    t.index ["catlevel2_id"], name: "index_catlevel3s_on_catlevel2_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grumble_id"
    t.integer "commenter_id"
    t.string "commenter_type"
    t.string "attachment"
    t.index ["commenter_type", "commenter_id"], name: "index_comments_on_commenter_type_and_commenter_id"
  end

  create_table "grumbles", force: :cascade do |t|
    t.string "file"
    t.integer "status"
    t.string "company_name"
    t.text "complain"
    t.integer "category_id"
    t.integer "catlevel1_id"
    t.integer "catlevel2_id"
    t.integer "catlevel3_id"
    t.string "city"
    t.string "state"
    t.date "date"
    t.integer "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grumbler_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_grumbles_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avarta"
    t.string "title"
    t.string "sex"
    t.string "phone"
    t.string "type"
    t.string "address"
    t.text "info"
    t.integer "category_id"
    t.integer "catlevel1_id"
    t.integer "catlevel2_id"
    t.integer "catlevel3_id"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sublevel_id"
    t.string "sublevel_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sublevel_type", "sublevel_id"], name: "index_users_on_sublevel_type_and_sublevel_id"
  end

end
