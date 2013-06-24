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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130624085840) do

  create_table "blocks", :force => true do |t|
    t.integer  "discipline_id"
    t.string   "year"
    t.integer  "block_num"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "blocks_examines", :id => false, :force => true do |t|
    t.integer "block_id"
    t.integer "examine_id"
  end

  create_table "blocks_groups", :id => false, :force => true do |t|
    t.integer "block_id"
    t.integer "group_id"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "disciplines_repository_themes", :id => false, :force => true do |t|
    t.integer "discipline_id"
    t.integer "repository_theme_id"
  end

  create_table "examines", :force => true do |t|
    t.string   "name"
    t.boolean  "necessary"
    t.boolean  "blocked"
    t.integer  "num_try"
    t.integer  "period"
    t.integer  "test_type"
    t.boolean  "w_key"
    t.boolean  "ext_access"
    t.boolean  "msiu_access"
    t.integer  "ordinal"
    t.date     "scheduled_date"
    t.integer  "scheduled_pair"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repository_themes", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "script_sub_themes", :force => true do |t|
    t.string   "name"
    t.integer  "start_num"
    t.integer  "end_num"
    t.integer  "questions_to_pass"
    t.integer  "questions_count"
    t.boolean  "order_questions"
    t.integer  "script_theme_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "script_themes", :force => true do |t|
    t.string   "name"
    t.integer  "repository_theme_id"
    t.integer  "questions_to_pass"
    t.integer  "subthemes_to_pass"
    t.boolean  "order_subthemes"
    t.integer  "script_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "scripts", :force => true do |t|
    t.string   "name"
    t.string   "redirect_page"
    t.integer  "time"
    t.boolean  "blocked"
    t.boolean  "order_themes"
    t.integer  "questions_to_pass"
    t.integer  "themes_to_pass"
    t.integer  "results"
    t.integer  "examine_id"
    t.integer  "base_script_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "middlename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
