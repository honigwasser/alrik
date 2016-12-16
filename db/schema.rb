# rubocop:disable all
ActiveRecord::Schema.define(version: 0) do

  create_table "characters", force: :cascade do |t|
    t.text "uuid", null: false
    t.text "name", null: false
    t.text "race", null: false
    t.text "profession", null: false
    t.text "sex", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.integer "created_by", null: false
    t.integer "updated_by"
  end

  create_table "characters_talents", force: true do |t|
    t.integer "character_id", null: false
    t.integer "talent_id", null: false
    t.integer "value"
  end

  create_table "talents", force: :cascade do |t|
    t.text "uuid", null: false
    t.text "name", null: false
    t.text "talent_type"
    t.text "category"
    t.text "properties", null: false
    t.datetime "created_at", null: false
  end

  add_index "characters_talents", ["character_id", "talent_id"], name: "IX_characters_talents", unique: true
end
