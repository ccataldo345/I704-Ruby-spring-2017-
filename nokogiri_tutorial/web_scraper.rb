require 'httparty'
require 'nokogiri'
# require 'json'
require 'pry'
require 'csv'

page = HTTParty.get('http://news.ycombinator.com')

parse_page = Nokogiri::HTML(page)

pets_array = []

#this is where we parse the data
parse_page.css('.storylink').map do |a|
	post_name = a.text
	pets_array.push(post_name)
end

#push array into a csv file
CSV.open('pets.csv', 'w') do |csv|
	csv << pets_array
end

# Pry.start(binding)
