require 'csv'
puts 'Event Manager Initialzed'

contents = CSV.open('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv',
 headers: true,
 header_converters: :symbol
 )

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  if zipcode.nil?
    zipcode = '00000'
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, '0')
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
  puts "#{name} #{zipcode}"
end