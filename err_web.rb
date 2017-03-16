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

def header
  a ="<h2>CHRISTIAN CATALDO<br/>"
  b ="<h3>IT COLLEGE TALLINN<br/>I704 RUBY<br/>March 2017</h3>"
  c ="<h3><u>err.ee news:</u><br/><br/<br</h3>" 
  result = [a, b, c]
  result.join("\n")
end

def articles(titles, links)
  result = (0..9).map do |i|
  a ="<pre>#{i+1})#{titles[i]}<br/></pre>"
  b ="<pre>   --> <a href=#{links[i]} target=_blank>#{links[i]}</a><br/><br/></pre>"
  result = [a, b]
  end
  result.join("\n")
end

def footer
  "<pre><br/><a href=http://news.err.ee/k/news target=_blank>*scraped from news.err.ee/k/news</pre>"
end

get '/' do
  header + articles(mytitles, mylinks) + footer
end
