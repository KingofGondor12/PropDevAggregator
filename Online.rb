require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

titles = []

doc1 = Nokogiri::HTML(open('http://ee24.com/'))
doc2 = Nokogiri::HTML(open('http://www.core-me.com/'))
doc3 = Nokogiri::HTML(open('http://off-planproperties.ae/'))
doc4 = Nokogiri::HTML(open('https://www.theurbandeveloper.com/'))

titles << doc1.title
titles << doc2.title
titles << doc3.title
titles << doc4.title

output.write(titles)

puts titles
