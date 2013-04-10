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

ActiveRecord::Schema.define(:version => 20130407234839) do

  create_table "blogposts", :force => true do |t|
    t.text     "content",    :limit => 255
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "title"
  end

  add_index "blogposts", ["user_id", "created_at"], :name => "index_blogposts_on_user_id_and_created_at"

  create_table "images", :force => true do |t|
    t.string   "image"
    t.integer  "written_lesson_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "images", ["written_lesson_id", "created_at"], :name => "index_images_on_written_lesson_id_and_created_at"

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news_items", ["user_id", "created_at"], :name => "index_news_items_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "premium",         :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "video_lessons", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "video_url"
    t.string   "video_format"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "video"
    t.integer  "video_lesson_id"
  end

  add_index "videos", ["video_lesson_id", "created_at"], :name => "index_videos_on_video_lesson_id_and_created_at"

  create_table "written_lessons", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
