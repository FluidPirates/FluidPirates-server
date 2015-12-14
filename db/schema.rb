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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151214101129) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["group_id"], name: "index_categories_on_group_id"

  create_table "choices", force: :cascade do |t|
    t.string   "name"
    t.integer  "proposition_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "choices", ["proposition_id"], name: "index_choices_on_proposition_id"

  create_table "delegations", force: :cascade do |t|
    t.integer  "delegee_id"
    t.integer  "representative_id"
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "delegations", ["category_id"], name: "index_delegations_on_category_id"
  add_index "delegations", ["delegee_id"], name: "index_delegations_on_delegee_id"
  add_index "delegations", ["representative_id"], name: "index_delegations_on_representative_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "polls", ["category_id"], name: "index_polls_on_category_id"
  add_index "polls", ["user_id"], name: "index_polls_on_user_id"

  create_table "propositions", force: :cascade do |t|
    t.string   "name"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "propositions", ["poll_id"], name: "index_propositions_on_poll_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["choice_id"], name: "index_votes_on_choice_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
