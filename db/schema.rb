# rubocop:disable all
ActiveRecord::Schema.define(version: 0) do

  create_table "characters", force: :cascade do |t|
    t.text "name", null: false
    t.text "race", null: false
    t.text "profession", null: false
    t.text "sex", null: false
    t.integer "age", null: false
    t.integer "height", null: false
    t.integer "weight", null: false
    t.text "eye_color", null: false
    t.text "hair_color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.integer "created_by", null: false
    t.integer "updated_by"
  end

  create_table "talents", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "talent_type_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
  end

  create_table "talent_types", force: :cascade do |t|
    t.text "name", null: false
    t.text "category"
    t.text "components", null: false
    t.datetime "created_at", null: false
  end

  add_index "talents", ["character_id", "talent_type_id"], name: "IX_character_talent_type", unique: true

  create_table "basic_attributes", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "basic_attribute_type_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
  end

  create_table "basic_attribute_types", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
  end

  add_index "basic_attributes", ["character_id", "basic_attribute_type_id"], name: "IX_character_basic_attribute_type", unique: true
end
