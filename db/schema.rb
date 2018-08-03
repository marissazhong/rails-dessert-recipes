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

ActiveRecord::Schema.define(version: 20180803203343) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "ingredients_pantries", id: false, force: :cascade do |t|
    t.integer "pantry_id", null: false
    t.integer "ingredient_id", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "recipe_id", null: false
    t.string "input_name"
    t.string "quantity"
    t.index ["ingredient_id"], name: "index_ingredients_recipes_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredients_recipes_on_recipe_id"
  end

  create_table "pantries", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.decimal "rating"
    t.text "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prep_time"
    t.integer "cook_time"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.string "image_url"
    t.integer "uid", limit: 8
  end

end
