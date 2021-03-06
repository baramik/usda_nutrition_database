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

ActiveRecord::Schema.define(version: 20151105190948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "food_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "food_category_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "nutrient_databank_number"
    t.string   "food_group_code"
    t.string   "short_description"
    t.string   "manufacturer_name"
    t.boolean  "survey"
    t.string   "refuse_description"
    t.integer  "percentage_refuse"
    t.float    "nitrogen_factor"
    t.float    "protein_factor"
    t.float    "fat_factor"
    t.float    "carbohydrate_factor"
    t.string   "long_description"
    t.string   "common_names"
    t.string   "scientific_name"
  end

  add_index "food_items", ["food_category_id"], name: "index_food_items_on_food_category_id", using: :btree

  create_table "foods_nutrients", force: :cascade do |t|
    t.integer  "food_item_id"
    t.integer  "nutrient_id"
    t.string   "nutrient_databank_number",                     null: false
    t.string   "nutrient_number",                              null: false
    t.float    "nutrient_value",                               null: false
    t.integer  "num_data_points",                              null: false
    t.float    "standard_error"
    t.string   "src_code",                                     null: false
    t.string   "derivation_code"
    t.string   "ref_nutrient_databank_number"
    t.boolean  "add_nutrient_mark",            default: false
    t.integer  "num_studies"
    t.float    "min"
    t.float    "max"
    t.integer  "degrees_of_freedom"
    t.float    "lower_error_bound"
    t.float    "upper_error_bound"
    t.string   "statistical_comments"
    t.string   "add_mod_date"
    t.string   "confidence_code"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "foods_nutrients", ["food_item_id"], name: "index_foods_nutrients_on_food_item_id", using: :btree
  add_index "foods_nutrients", ["nutrient_id"], name: "index_foods_nutrients_on_nutrient_id", using: :btree

  create_table "footnotes", force: :cascade do |t|
    t.integer  "food_item_id"
    t.integer  "nutrient_id"
    t.string   "nutrient_databank_number", null: false
    t.string   "footnote_number",          null: false
    t.string   "footnote_type",            null: false
    t.string   "nutrient_number"
    t.string   "footnote_text",            null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "footnote_id"
  end

  add_index "footnotes", ["food_item_id"], name: "index_footnotes_on_food_item_id", using: :btree
  add_index "footnotes", ["footnote_number"], name: "index_footnotes_on_footnote_number", using: :btree
  add_index "footnotes", ["footnote_type"], name: "index_footnotes_on_footnote_type", using: :btree
  add_index "footnotes", ["nutrient_databank_number"], name: "index_footnotes_on_nutrient_databank_number", using: :btree
  add_index "footnotes", ["nutrient_id"], name: "index_footnotes_on_nutrient_id", using: :btree
  add_index "footnotes", ["nutrient_number"], name: "index_footnotes_on_nutrient_number", using: :btree

  create_table "nutrient_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrient_values", force: :cascade do |t|
    t.decimal  "value",         precision: 10, scale: 3
    t.integer  "food_items_id"
    t.integer  "nutrients_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "nutrient_values", ["food_items_id"], name: "index_nutrient_values_on_food_items_id", using: :btree
  add_index "nutrient_values", ["nutrients_id"], name: "index_nutrient_values_on_nutrients_id", using: :btree

  create_table "nutrients", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "nutrient_categories_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "nutrient_code"
    t.string   "nutrient_number"
    t.string   "units"
    t.string   "tagname"
    t.string   "nutrient_description"
    t.string   "number_decimal_places"
    t.string   "sort_record_order"
  end

  add_index "nutrients", ["nutrient_categories_id"], name: "index_nutrients_on_nutrient_categories_id", using: :btree

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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weights", force: :cascade do |t|
    t.integer  "food_item_id"
    t.string   "nutrient_databank_number", null: false
    t.string   "sequence_number",          null: false
    t.float    "amount",                   null: false
    t.string   "measurement_description",  null: false
    t.float    "gram_weight",              null: false
    t.integer  "num_data_points"
    t.float    "standard_deviation"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "weights", ["food_item_id"], name: "index_weights_on_food_item_id", using: :btree
  add_index "weights", ["nutrient_databank_number"], name: "index_weights_on_nutrient_databank_number", using: :btree

end
