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

ActiveRecord::Schema.define(version: 20151229151205) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "group_id",                 null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description", default: ""
  end

  add_index "categories", ["group_id"], name: "index_categories_on_group_id"

  create_table "choices", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "proposition_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "choices", ["proposition_id"], name: "index_choices_on_proposition_id"

  create_table "delegations", force: :cascade do |t|
    t.integer  "delegator_id", null: false
    t.integer  "delegatee_id", null: false
    t.integer  "category_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "delegations", ["category_id"], name: "index_delegations_on_category_id"
  add_index "delegations", ["delegatee_id"], name: "index_delegations_on_delegatee_id"
  add_index "delegations", ["delegator_id"], name: "index_delegations_on_delegator_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description", default: ""
    t.string   "domain"
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "key",        null: false
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invitations", ["group_id"], name: "index_invitations_on_group_id"
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "group_id",                      null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "role",       default: "member"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "polls", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "user_id",                  null: false
    t.integer  "category_id",              null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description", default: ""
    t.datetime "open_at"
    t.datetime "close_at"
  end

  add_index "polls", ["category_id"], name: "index_polls_on_category_id"
  add_index "polls", ["user_id"], name: "index_polls_on_user_id"

  create_table "propositions", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.integer  "poll_id",                                   null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "description",               default: ""
    t.integer  "maximum_of_votes_per_user", default: 1
    t.boolean  "ranked",                    default: false
    t.integer  "number_of_winning_choices", default: 1
  end

  add_index "propositions", ["poll_id"], name: "index_propositions_on_poll_id"

  create_table "tokens", force: :cascade do |t|
    t.string   "value",      null: false
    t.datetime "expires_at", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "choice_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rank"
  end

  add_index "votes", ["choice_id"], name: "index_votes_on_choice_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
