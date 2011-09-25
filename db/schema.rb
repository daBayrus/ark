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

ActiveRecord::Schema.define(:version => 20110923155603) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", :force => true do |t|
    t.float    "amount"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_documents", :force => true do |t|
    t.string  "name"
    t.string  "doc_file_name"
    t.string  "doc_content_type"
    t.integer "doc_file_size"
    t.integer "project_id"
  end

  create_table "project_images", :force => true do |t|
    t.string  "name"
    t.string  "image_file_name"
    t.string  "image_content_type"
    t.integer "image_file_size"
    t.integer "project_id"
  end

  create_table "project_videos", :force => true do |t|
    t.string  "name"
    t.string  "video_file_name"
    t.string  "video_content_type"
    t.integer "video_file_size"
    t.integer "project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.date     "deadline"
    t.float    "funding_required"
    t.integer  "status_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
