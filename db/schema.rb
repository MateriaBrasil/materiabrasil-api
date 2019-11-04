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

ActiveRecord::Schema.define(version: 2019_11_04_143143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "addresses", force: :cascade do |t|
    t.bigint "supplier_id"
    t.string "address_type", null: false
    t.string "street_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.string "zip_code"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_addresses_on_supplier_id"
  end

  create_table "album_users", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_users_on_album_id"
    t.index ["user_id"], name: "index_album_users_on_user_id"
  end

  create_table "albums", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.boolean "default", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "about_type", null: false
    t.bigint "about_id", null: false
    t.bigint "question_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["about_type", "about_id", "question_id"], name: "index_answers_on_about_type_and_about_id_and_question_id", unique: true
    t.index ["about_type", "about_id"], name: "index_answers_on_about_type_and_about_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multiple_choice", default: true
    t.integer "sorting"
    t.boolean "has_page", default: false
    t.text "description"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_favorites_on_album_id"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
  end

  create_table "material_categories", force: :cascade do |t|
    t.bigint "material_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_material_categories_on_category_id"
    t.index ["material_id"], name: "index_material_categories_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.string "average_price"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "technical_specification_url"
    t.boolean "highlighted", default: false, null: false
    t.string "cover_image_url"
    t.string "highlight_image_url"
    t.string "list_image_url"
    t.bigint "supplier_id"
    t.string "unit_of_sale"
    t.integer "minimum_purchase_quantity"
    t.integer "maximum_purchase_quantity"
    t.string "ncm_code"
    t.string "sh_code"
    t.text "certifications"
    t.text "prizes"
    t.string "density"
    t.string "dimensions"
    t.string "availability"
    t.string "certifications_url"
    t.decimal "materiality_driver"
    t.decimal "manufacture_driver"
    t.decimal "management_driver"
    t.decimal "social_driver"
    t.boolean "published", default: false
    t.boolean "pre_published", default: false
    t.index ["supplier_id"], name: "index_materials_on_supplier_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "from_type", null: false
    t.bigint "from_id", null: false
    t.string "to_type", null: false
    t.bigint "to_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_type", "from_id"], name: "index_messages_on_from_type_and_from_id"
    t.index ["to_type", "to_id"], name: "index_messages_on_to_type_and_to_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "description", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name", null: false
    t.string "about_type", null: false
    t.string "driver", null: false
    t.integer "sorting", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "label"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id", null: false
    t.text "description", null: false
    t.integer "sorting", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight_for_small_companies", default: 0
    t.integer "weight_for_medium_companies", default: 0
    t.integer "weight_for_large_companies", default: 0
    t.integer "weight_for_service_companies", default: 0
    t.text "helper_text", default: ""
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.text "text", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "state", default: "pending", null: false
    t.string "payment_method"
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "iugu_id"
    t.index ["iugu_id"], name: "index_subscriptions_on_iugu_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.string "website", null: false
    t.string "email", null: false
    t.string "cnpj", null: false
    t.string "company_name", null: false
    t.string "municipal_subscription", null: false
    t.string "state_subscription", null: false
    t.string "phone", null: false
    t.string "company_revenue"
    t.integer "number_of_employees"
    t.string "reach", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "type_of_company", default: 1
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subject", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public_profile", default: true, null: false
    t.string "last_name", null: false
    t.string "image_url"
    t.string "city"
    t.string "state"
    t.string "country"
    t.boolean "newsletter"
    t.text "bio"
    t.string "company"
    t.string "work_title"
    t.string "website"
    t.string "iugu_id"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "addresses", "suppliers"
  add_foreign_key "album_users", "albums"
  add_foreign_key "album_users", "users"
  add_foreign_key "albums", "users"
  add_foreign_key "answers", "options", on_delete: :cascade
  add_foreign_key "answers", "questions", on_delete: :cascade
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "albums"
  add_foreign_key "material_categories", "categories"
  add_foreign_key "material_categories", "materials"
  add_foreign_key "materials", "suppliers"
  add_foreign_key "options", "questions", on_delete: :cascade
  add_foreign_key "questions", "questionnaires", on_delete: :restrict
  add_foreign_key "reviews", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "suppliers", "users"
  add_foreign_key "topics", "users"
end
