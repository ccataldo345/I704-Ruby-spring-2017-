require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

page = HTTParty.get('http://news.err.ee/k/news')

parse_page = Nokogiri::HTML(page)

mytitles = []
mylinks = []

#this is where we parse the data
parse_page.css('.category-news-header').map do |i|
  post_name = i.text.gsub(/\s+/, " ") 	#gsubs removes tabs and new lines and spaces
  mytitles.push(post_name)
end

parse_page.css('.category-news-header').css('a').map do |i|
  post_name = i.attributes["href"]   #parse links only from '.storylink' class
  mylinks.push(post_name)
end

puts("CHRISTIAN CATALDO - IT COLLEGE TALLINN - I704 RUBY - March 2017")
puts("see result on webpage: http://localhost:8080/")
puts("data scraped from: http://news.err.ee/k/news")

#(0..9).each do |i|
#  get '/' do
#    "ERR NEWS: <br /><br /> #{i+1})#{mytitles[i]} <br /> --> <a href=#{mylinks[i]} target=_blank>#{mylinks[i]}</a>"
#  end
#  (0..9).each do |i|
get '/' do
  "CHRISTIAN CATALDO <br /> IT COLLEGE TALLINN - I704 RUBY - March 2017 <br /><br /> ERR.EE NEWS: <br /><br /> #{1})#{mytitles[0]} <br /> &emsp; --> <a href=#{mylinks[0]} target=_blank>#{mylinks[0]}</a> <br /><br />#{2})#{mytitles[1]} <br /> &emsp; --> <a href=#{mylinks[1]} target=_blank>#{mylinks[1]}</a> <br /><br />#{3})#{mytitles[2]} <br /> &emsp; --> <a href=#{mylinks[2]} target=_blank>#{mylinks[2]}</a> <br /><br /> *data scraped from <a href=http://news.err.ee/k/news target=_blank>news.err.ee/k/news</a>"
end
#end

