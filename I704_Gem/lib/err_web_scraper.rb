require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

page = HTTParty.get('http://news.err.ee/k/news')

parse_page = Nokogiri::HTML(page)

mytimes = []
mytitles = []
mylinks = []

# this is where we parse the data
parse_page.css('.right-block').map do |i|
  post_name = i.text
  mytimes.push(post_name)
end

parse_page.css('.category-news-header').map do |i|
  post_name = i.text.gsub(/\s+/, ' ')
  mytitles.push(post_name)
end

parse_page.css('.category-news-header').css('a').map do |i|
  post_name = i.attributes['href'] # parse links only from '.storylink' class
  mylinks.push(post_name)
end

# print result
(0..9).each do |i|
  # puts "#{mytimes[i]} #{mytitles[i]}"
  puts "#{i + 1})#{mytitles[i]}"
  puts "   --> #{mylinks[i]}" # also: #puts "   --> #{mylinks[i]}"
  puts ''
end

# push array into a csv file
# CSV.open('data.csv', 'w') do |csv|
#	csv << data
# end

# Pry.start(binding)
