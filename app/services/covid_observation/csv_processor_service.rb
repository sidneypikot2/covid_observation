require 'csv'
class CovidObservation::CsvProcessorService < ApplicationService
  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    serialized_csv = serialize_csv

    CsvProcessor::DeleteTmpCsvService.call(csv_file)

    ActiveRecord::Base.transaction do
      result = CovidObservation.create(serialized_csv)
      if result.all?(&:persisted?)
        return true
      else
        raise ActiveRecord::RecordInvalid
      end
    rescue ActiveRecord::RecordInvalid
      raise ActiveRecord::Rollback
    end
  end

  private

  def serialize_csv
    array = []
    CSV.foreach(csv_file, col_sep: ',', headers: true) do |row|
      covid_observation = CovidObservation::Serialize.call(row.to_hash)
      array << covid_observation
    end
    array
  end
end