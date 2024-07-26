puts 'Event Manager Initialzed'

persons_details = File.read('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv')

lines = File.readlines('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv')
row_index = 0
lines.each do |line|
  row_index = (row_index + 1)
  next if row_index == 1
  column = line.split(',')
  name = column[2]
  puts name
end

