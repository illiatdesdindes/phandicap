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

ActiveRecord::Schema.define(:version => 20110926135849) do

  create_table "evenements", :force => true do |t|
    t.string   "titre"
    t.text     "detail"
    t.string   "statut",     :default => "nouveau"
    t.datetime "date"
    t.text     "adresse"
    t.integer  "membre_id"
    t.integer  "region_id"
    t.string   "whodunit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membres", :force => true do |t|
    t.string   "nom"
    t.string   "mail"
    t.text     "adresse"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
