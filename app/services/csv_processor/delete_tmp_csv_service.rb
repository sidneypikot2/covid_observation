require 'csv'
class CsvProcessor::DeleteTmpCsvService < ApplicationService
  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    File.delete(csv_file)
  end
end