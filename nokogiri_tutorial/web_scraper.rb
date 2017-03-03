require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

page = HTTParty.get('http://news.ycombinator.com')

parse_page = Nokogiri::HTML(page)

myranks = []
mytitles = []
mylinks = []

#this is where we parse the data
parse_page.css('.rank').map do |i|
  post_name = i.text
  myranks.push(post_name)
end

parse_page.css('.storylink').map do |i|
  post_name = i.text
  mytitles.push(post_name)
end

parse_page.css('.storylink').map do |i|
  post_name = i.attributes["href"]   #parse links only from '.storylink' class
  mylinks.push(post_name)
end

#print result
(0..9).each do |i|
  puts "#{myranks[i]} #{mytitles[i]}"  #also: #puts "#{i+1}) #{mytitles[i]}"
  puts "   --> #{mylinks[i]}"           #also: #puts "   --> #{mylinks[i]}"
end

#push array into a csv file
#CSV.open('data.csv', 'w') do |csv|
#  csv << mytitles
#end

# Pry.start(binding)
