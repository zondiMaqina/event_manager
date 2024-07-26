puts 'Event Manager Initialzed'

persons_details = File.read('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv')
puts persons_details

lines = File.readlines('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv')
lines.each do |line|
  puts line
end

