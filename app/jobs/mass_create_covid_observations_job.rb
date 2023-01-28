class MassCreateCovidObservationsJob
  include Sidekiq::Job

  def perform(file_name)
    result = CovidObservation::CsvProcessorService.call(file_name)
  end
end