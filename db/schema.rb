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

ActiveRecord::Schema.define(version: 2020_08_16_015354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "role", default: "read", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "charge_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "collectors", force: :cascade do |t|
    t.string "name"
    t.string "no"
    t.bigint "gpr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gpr_id"], name: "index_collectors_on_gpr_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_currencies", force: :cascade do |t|
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_currencies_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "identityId"
    t.string "phone"
    t.boolean "gender"
    t.string "address"
    t.bigint "meter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "charge_id"
    t.index ["charge_id"], name: "index_customers_on_charge_id"
    t.index ["meter_id"], name: "index_customers_on_meter_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gprs", force: :cascade do |t|
    t.string "name"
    t.string "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meters", force: :cascade do |t|
    t.string "name"
    t.integer "no", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gpr_id"
    t.integer "factory_id"
    t.index ["factory_id"], name: "index_meters_on_factory_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "gprs_no"
    t.string "water_no"
    t.string "meter_no"
    t.string "customer_no"
    t.string "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cmdcode"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ancestry_depth", default: 0
    t.index ["ancestry"], name: "index_pages_on_ancestry"
  end

  create_table "plans", force: :cascade do |t|
    t.string "plan_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans_cities", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "plan_id"
    t.index ["city_id"], name: "index_plans_cities_on_city_id"
    t.index ["plan_id"], name: "index_plans_cities_on_plan_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "product"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "survers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_trees_on_ancestry"
  end

  create_table "waters", force: :cascade do |t|
    t.string "name"
    t.string "no"
    t.bigint "meter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_id"], name: "index_waters_on_meter_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "cities", "regions"
  add_foreign_key "collectors", "gprs"
  add_foreign_key "customer_currencies", "customers"
  add_foreign_key "customers", "meters"
  add_foreign_key "regions", "countries"
  add_foreign_key "waters", "meters"
end
