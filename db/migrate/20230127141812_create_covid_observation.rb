class CreateCovidObservation < ActiveRecord::Migration[6.1]
  def change
    create_table :covid_observations do |t|
      t.string     :province
      t.string     :country

      t.integer    :s_no
      t.integer    :confirmed, default: 0
      t.integer    :deaths,    default: 0
      t.integer    :recovered, default: 0

      t.datetime   :observation_date
      t.datetime   :last_update
      t.timestamps
    end
  end
end
