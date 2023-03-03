# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_27_141812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "covid_observations", force: :cascade do |t|
    t.string "province"
    t.string "country"
    t.integer "s_no"
    t.integer "confirmed", default: 0
    t.integer "deaths", default: 0
    t.integer "recovered", default: 0
    t.datetime "observation_date"
    t.datetime "last_update"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
