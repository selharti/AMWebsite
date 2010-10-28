# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101024135200) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       :precision => 8, :scale => 2, :default => 0.0
  end

  create_table "events_members", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "member_id"
  end

  create_table "members", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "function"
    t.string   "phone_office"
    t.string   "phone_cell"
    t.string   "phone_home"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "is_admin",        :default => false
  end

  create_table "messages", :force => true do |t|
    t.string   "from"
    t.text     "body"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
