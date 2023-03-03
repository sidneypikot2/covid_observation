require 'csv'
class CsvProcessor::CreateTmpCsvService < ApplicationService
  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    dir = Rails.root.join('tmp', 'csv')
    #creates the folder uploads if it dosen’t exist
    Dir.mkdir(dir, 0700) unless Dir.exist?(dir)
    incoming_file = csv_file
    #generate name of the file
    file_name = dir.join("#{Time.now.to_i}.csv")
    #reading from the uploaded file and writing to new file
    File.open(file_name, 'wb') do |file|
        file.write(incoming_file.read)
    end
    file_name
  end
end