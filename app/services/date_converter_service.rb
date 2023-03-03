
require 'date'
class DateConverterService < ApplicationService
  DEFAULT_FORMAT = '%m/%d/%Y'

  attr_reader :date_string, :date_format

  def initialize(date_string, date_format = DEFAULT_FORMAT)
    @date_string = date_string
    @date_format = date_format
  end

  def call
    return nil if !date_string
    DateTime.strptime(date_string, date_format)
    rescue ArgumentError
      nil
  end
end