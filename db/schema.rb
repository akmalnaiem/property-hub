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

ActiveRecord::Schema[8.1].define(version: 2026_01_15_073859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.integer "cities_covered"
    t.datetime "created_at", null: false
    t.integer "happy_customers"
    t.text "hero_subtitle"
    t.string "hero_title"
    t.text "mission_description"
    t.string "mission_title"
    t.integer "properties_listed"
    t.datetime "updated_at", null: false
    t.text "values_offer"
    t.text "values_why"
    t.text "vision_description"
    t.string "vision_title"
    t.integer "years_experience"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "slug"
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "blog_category_id", null: false
    t.string "city"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "published_at"
    t.string "state"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["blog_category_id"], name: "index_blogs_on_blog_category_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "icon"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "hero_badge_text"
    t.text "hero_subtitle"
    t.string "hero_title"
    t.datetime "updated_at", null: false
    t.text "why_choose"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "area_sqft"
    t.integer "bathrooms"
    t.integer "bedrooms"
    t.string "city"
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "furnished"
    t.string "location"
    t.decimal "price"
    t.string "property_category"
    t.integer "property_category_id", null: false
    t.integer "property_type"
    t.integer "property_type_id"
    t.boolean "published"
    t.integer "sale_status"
    t.string "slug"
    t.string "state"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["property_category_id"], name: "index_properties_on_property_category_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
    t.index ["slug"], name: "index_properties_on_slug", unique: true
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "property_features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "feature_id", null: false
    t.integer "property_id", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_property_features_on_feature_id"
    t.index ["property_id"], name: "index_property_features_on_property_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "property_category_id", null: false
    t.datetime "updated_at", null: false
    t.index ["property_category_id"], name: "index_property_types_on_property_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "phone_number"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "blog_categories"
  add_foreign_key "blogs", "users"
  add_foreign_key "properties", "property_categories"
  add_foreign_key "properties", "property_types"
  add_foreign_key "properties", "users"
  add_foreign_key "property_features", "features"
  add_foreign_key "property_features", "properties"
  add_foreign_key "property_types", "property_categories"
end
