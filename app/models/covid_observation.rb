class CovidObservation < ActiveRecord::Base

validates :s_no, presence: true
validates :observation_date, presence: true
validates :country, presence: true
end