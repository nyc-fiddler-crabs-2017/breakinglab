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

ActiveRecord::Schema.define(version: 20170531162149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commenter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.string "title", null: false
    t.string "status", null: false
    t.string "results"
    t.string "conclusions"
    t.bigint "experimenter_id"
    t.bigint "proposal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experimenter_id"], name: "index_experiments_on_experimenter_id"
    t.index ["proposal_id"], name: "index_experiments_on_proposal_id"
  end

  create_table "observations", force: :cascade do |t|
    t.string "body", null: false
    t.integer "observable_id", null: false
    t.string "observable_type", null: false
    t.bigint "observer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observer_id"], name: "index_observations_on_observer_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "steps"
    t.bigint "experiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_procedures_on_experiment_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "summary", null: false
    t.string "hypothesis", null: false
    t.string "status", default: "open"
    t.bigint "proposer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposer_id"], name: "index_proposals_on_proposer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "access", default: "labtech"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
