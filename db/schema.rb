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

ActiveRecord::Schema.define(version: 20160826092512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "completed"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "phase_id"
    t.integer  "sprint_id"
    t.integer  "team_id"
    t.string   "domain"
    t.text     "assumption"
    t.text     "method"
    t.text     "observation"
    t.text     "measure"
    t.text     "learned"
    t.text     "success_criteria"
    t.text     "action"
    t.integer  "interviews_planned"
    t.integer  "interviews_done"
    t.integer  "early_adopters_planned"
    t.integer  "early_adopters_converted"
    t.boolean  "conclusion"
    t.index ["phase_id"], name: "index_experiments_on_phase_id", using: :btree
    t.index ["sprint_id"], name: "index_experiments_on_sprint_id", using: :btree
    t.index ["team_id"], name: "index_experiments_on_team_id", using: :btree
  end

  create_table "experiments_sprints", id: false, force: :cascade do |t|
    t.integer "experiment_id", null: false
    t.integer "sprint_id",     null: false
  end

  create_table "phases", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "interval"
    t.integer  "sequence"
    t.text     "long_term_vision"
    t.text     "kpi_s"
    t.text     "criteria"
    t.text     "bottlenecks"
    t.text     "problem_definition"
    t.text     "solutions"
    t.text     "long_term"
    t.text     "key_benefits"
    t.text     "vision"
    t.text     "test_first"
    t.text     "proof_of_value"
    t.text     "background"
    t.text     "note"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "project_id"
    t.boolean  "completed"
    t.index ["project_id"], name: "index_phases_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "current_stage_id"
    t.integer  "user_id"
    t.integer  "portfoliomanager_id"
    t.integer  "coach_id"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "sprints", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "completed"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "phase_id"
    t.text     "things_done"
    t.text     "things_learned"
    t.integer  "est_points"
    t.float    "avg_happy"
    t.integer  "on_target"
    t.integer  "organization_helping"
    t.integer  "able_to_pull_of"
    t.text     "impediment"
    t.integer  "act_points"
    t.text     "retro_actions"
    t.index ["phase_id"], name: "index_sprints_on_phase_id", using: :btree
  end

  create_table "steps", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experiment_id"
    t.index ["experiment_id"], name: "index_steps_on_experiment_id", using: :btree
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_members_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_teams_on_phase_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "phonenumber"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "experiments", "phases"
  add_foreign_key "experiments", "teams"
  add_foreign_key "phases", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "sprints", "phases"
  add_foreign_key "steps", "experiments"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "phases"
end
