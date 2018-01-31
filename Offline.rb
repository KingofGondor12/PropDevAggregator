require 'Nokogiri'

file = File.open('AirtableUniverse.html')
html = Nokogiri::HTML(file)

puts html.at_css('.background-cover')
