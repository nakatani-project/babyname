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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110607213128) do

  create_table "babies", :force => true do |t|
    t.string   "name"
    t.integer  "lang_count"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "babylangs", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "lang_id"
    t.string   "pronun"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "babyregions", :force => true do |t|
    t.integer  "baby_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "celebs", :force => true do |t|
    t.integer  "baby_id"
    t.string   "last_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", :force => true do |t|
    t.string   "baby_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meanings", :force => true do |t|
    t.integer  "baby_id"
    t.string   "character"
    t.string   "meaning"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nicknames", :force => true do |t|
    t.integer  "baby_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "originlangs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origins", :force => true do |t|
    t.integer  "baby_id"
    t.string   "name"
    t.integer  "originlang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relateds", :force => true do |t|
    t.integer  "baby_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shorts", :force => true do |t|
    t.integer  "babylang_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
