# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151013211307) do

  create_table "account_settings", force: true do |t|
    t.string   "time_zone"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.string   "supplier_id"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_organizations", force: true do |t|
    t.integer  "company_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_organizations", ["company_id"], name: "index_company_organizations_on_company_id"
  add_index "company_organizations", ["organization_id"], name: "index_company_organizations_on_organization_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headquarters", force: true do |t|
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "headquarters", ["company_id"], name: "index_headquarters_on_company_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "url"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"

  create_table "wtf_ashtrays", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wtf_cigarettes", force: true do |t|
    t.string   "brand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
