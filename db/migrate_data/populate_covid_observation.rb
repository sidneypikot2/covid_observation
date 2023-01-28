class PopulateCovidObservation
  def self.call
    file_name = Rails.root.join('db', 'covid_19_data.csv')
    MassCreateCovidObservationsJob.perform_async(file_name)
  end
end

PopulateCovidObservation.call