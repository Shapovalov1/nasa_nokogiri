require 'nokogiri'
require 'open-uri'

url = "https://www.nasa.gov/api/2/ubernode/479003"
page = Nokogiri::HTML.parse(URI.open(url))

hash = eval(page.text)
title = hash[:_source][:title]
release_no = hash[:_source][:"release-id"]
date = Date.parse hash[:_source][:"promo-date-time"]
article = hash[:_source][:body].gsub(/\R+/, "\n").gsub(/(.*\s){3}(Credits: NASA)$/, '').chomp("-end-")

res = { "title" => title, "date" => date, "release_no" => release_no, "article" => article}

puts res
