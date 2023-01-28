class CovidObservation::Serialize < ApplicationService
  attr_reader :row_hash

  def initialize(row_hash)
    @row_hash = row_hash
  end

  def call
    {
      s_no:                 row_hash['SNo'],
      observation_date:     DateConverterService.call(row_hash['ObservationDate']),
      province:             row_hash['Province/State'],
      country:              row_hash['Country/Region'],
      last_update:          row_hash['Last Update'],
      confirmed:            row_hash['Confirmed'],
      deaths:               row_hash['Deaths'],
      recovered:            row_hash['Recovered'],
    }
  end
end
