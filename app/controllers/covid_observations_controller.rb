class CovidObservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def upload
    file_name = CsvProcessor::CreateTmpCsvService.call(params[:csv])
    MassCreateCovidObservationsJob.perform_async(file_name)
    head :ok
  end

  def top_confirmed
    @covid_observations = CovidObservation::GetTopConfirmedPerCountryQuery.call(params)
    @observation_date = params[:observation_date]
    respond_to do |format|
      format.json
    end
  end
end
