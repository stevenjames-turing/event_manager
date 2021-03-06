module DataCleaner

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_name(name)
    name.capitalize
  end

  def clean_phone(phone)
    phone.scan(/\d/).join("")
  end
  #
  # contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
  #
  # contents.each do |row|
  #   name = row[:first_name]
  #   zipcode = clean_zipcode(row[:zipcode])
  #
  #   puts "#{name} #{zipcode}"
  # end

end
