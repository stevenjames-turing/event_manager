require 'csv'
require './data_cleaner'

class EventReporter
  include DataCleaner

  attr_reader :event_attendees

  def initialize
    @event_attendees = {}
    @queue = []
  end

  def load(file = "./full_event_attendees.csv")
    load = CSV.open file, headers: true, header_converters: :symbol
    load.each do |row|
      if !@event_attendees.has_key?(row[:id])
        @event_attendees[row[:id].to_i] = {}
      end
      @event_attendees[row[:id].to_i][:reg_date] = row[:regdate]
      @event_attendees[row[:id].to_i][:first_name] = clean_name(row[:first_name])
      @event_attendees[row[:id].to_i][:last_name] = clean_name(row[:last_name])
      @event_attendees[row[:id].to_i][:full_name] = "#{clean_name(row[:first_name])} #{clean_name(row[:last_name])}"
      @event_attendees[row[:id].to_i][:email_address] = row[:email_address]
      @event_attendees[row[:id].to_i][:home_phone] = row[:homephone]
      @event_attendees[row[:id].to_i][:street] = row[:street]
      @event_attendees[row[:id].to_i][:city] = row[:city]
      @event_attendees[row[:id].to_i][:state] = row[:state]
      @event_attendees[row[:id].to_i][:zipcode] = clean_zipcode(row[:zipcode])
    end
  end

  

end
