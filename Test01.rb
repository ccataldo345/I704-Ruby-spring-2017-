require "net/http"
html = Net::HTTP.get(URI("news.err.ee"))
puts html
