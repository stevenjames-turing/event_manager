require './lib/event_reporter'
require './lib/data_cleaner'


RSpec.describe EventReporter do
  let (:event_reporter) {EventReporter.new}

  it 'exists' do
    expect(event_reporter).to be_instance_of(EventReporter)
  end

  it 'initializes with no event attendees' do
    expect(event_reporter.event_attendees).to eq({})
  end

  it 'can clean zip code data to ensure proper formatting if data input is incorrect' do
    bad_zip1 = 7306
    bad_zip2 = nil

    expect(event_reporter.clean_zipcode(bad_zip1)).to eq("07306")
    expect(event_reporter.clean_zipcode(bad_zip2)).to eq("00000")
  end

  it 'can clean names to ensure proper formatting if data input is incorrect' do
    bad_name1 = "SArah"
    bad_name2 = "sTeVEn"

    expect(event_reporter.clean_name(bad_name1)).to eq("Sarah")
    expect(event_reporter.clean_name(bad_name2)).to eq("Steven")
  end

  it 'can clean phone numbers to ensure proper formatting if data input is incorrect' do
    bad_num1 = "613 565-4000"
    bad_num2 = "(941)979-2000"

    expect(event_reporter.clean_phone(bad_num1)).to eq("6135654000")
    expect(event_reporter.clean_phone(bad_num2)).to eq("9419792000")
  end

  it 'can load CSV file of event attendees and create hash of attendees with clean data' do
    event_reporter.load("test_attendees.csv")

    expected = {
      1 => {:city=>"Washington", :email_address=>"arannon@jumpstartlab.com", :first_name=>"Allison", :full_name=>"Allison Nguyen", :home_phone=>"6154385000", :last_name=>"Nguyen", :reg_date=>"11/12/08 10:47", :state=>"DC", :street=>"3155 19th St NW", :zipcode=>"20010"},
      2 => {:city=>"Washington", :email_address=>"pinalevitsky@jumpstartlab.com", :first_name=>"Sarah", :full_name=>"Sarah Hankins", :home_phone=>"4145205000", :last_name=>"Hankins", :reg_date=>"11/12/08 13:23", :state=>"DC", :street=>"2022 15th Street NW", :zipcode=>"20009"},
      3 => {:city=>"Saint Petersburg", :email_address=>"lqrm4462@jumpstartlab.com", :first_name=>"Sarah", :full_name=>"Sarah Xx", :home_phone=>"9419792000", :last_name=>"Xx", :reg_date=>"11/12/08 13:30", :state=>"FL", :street=>"4175 3rd Street North", :zipcode=>"33703"},
      4 => {:city=>"Jersey City", :email_address=>"gdlia.lepping@jumpstartlab.com", :first_name=>"David", :full_name=>"David Thomas", :home_phone=>"6507990000", :last_name=>"Thomas", :reg_date=>"11/25/08 19:21", :state=>"NJ", :street=>"9 garrison ave", :zipcode=>"07306"},
      5 => {:city=>"Ottawa", :email_address=>"fpmorgan07@jumpstartlab.com", :first_name=>"Chris", :full_name=>"Chris Sackett", :home_phone=>"6135654000", :last_name=>"Sackett", :reg_date=>"2/2/09 11:29", :state=>"ON", :street=>"173 Daly Ave", :zipcode=>"00000"}}

      expect(event_reporter.event_attendees).to eq(expected)
    end
end
