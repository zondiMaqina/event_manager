require 'csv'
puts 'Event Manager Initialzed'

contents = CSV.open('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv',
 headers: true,
 header_converters: :symbol
 )

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  # If the zip code is exactly five digits, assume it is okay
  # if the zip code is more than five digits, truncate it to the first five digits
  # # if zip code is less than five digits, add zeros in front until it becomes five digits
  puts "#{name} #{zipcode}"
end