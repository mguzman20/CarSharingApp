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

ActiveRecord::Schema.define(version: 2022_06_10_223732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "solicitud_id", null: false
    t.integer "sol_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["solicitud_id"], name: "index_messages_on_solicitud_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "salida"
    t.string "tipo"
    t.integer "limite"
    t.string "direccion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "hora"
    t.date "dia"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "calificacion"
    t.string "contenido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "publication_id", null: false
    t.string "estado"
    t.index ["publication_id"], name: "index_solicituds_on_publication_id"
    t.index ["user_id"], name: "index_solicituds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "age"
    t.string "name"
    t.string "photo"
    t.string "work"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "solicituds"
  add_foreign_key "messages", "users"
  add_foreign_key "publications", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "solicituds", "publications"
  add_foreign_key "solicituds", "users"
end
