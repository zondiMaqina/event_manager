require 'csv'
puts 'Event Manager Initialzed'

contents = CSV.open('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv', headers: true)
contents.each do |row|
  name = row[2]
  puts name
end