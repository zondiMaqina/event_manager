require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def legislator_by_zipcode(zipcode)
civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

begin
  civic_info.representative_info_by_address(
    address: zip,
    levels: 'country',
    roles: ['legislatorUpperBody', 'legislatorLowerBody']
  ).officials
rescue
  'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
end
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_cellnumber(number)
  number = number.to_s.gsub(/[^\w]/, '')
  span = 11
  if number.length > span || number.length < 10
    number = '-'
  elsif number.length == span && number[0] == '1'
    number.sub('1', '')
  elsif number.length == span && number[0] != '1'
    number = '-'
  else
    number
  end
end

puts 'Event Manager Initialzed'
template_letter = File.read('/home/zondi-maqina/ruby_projects/event_manager/lib/form_letter.erb')
erb_template = ERB.new template_letter
contents = CSV.open('/home/zondi-maqina/ruby_projects/event_manager/event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

def thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

@times = Array.new
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  number = row[5]
  zipcode = clean_zipcode(row[:zipcode])
  date_time = row[1]
  legislators = legislator_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  thank_you_letter(id,form_letter)
  clean_cellnumber(number)
  @times << date_time.split(' ')[1]
end

def number_of_people()
  times = Array.new

  @times.each do |time|
    times << time[0..1].gsub(/[^\w]/, '')
  end
  hours = Hash.new(0)
  times.inject(hours) do |acc, time|
    acc[time] += 1
    acc
  end
  puts hours
end

number_of_people
# WHich hours of the day most people registered
# find specifically hour
