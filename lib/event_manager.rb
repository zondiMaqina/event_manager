require 'csv'
puts 'Event Manager Initialzed'

contents = CSV.open('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv',
 headers: true,
 header_converters: :symbol
 )

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  
  puts "#{name} #{zipcode}"
end