require 'Nokogiri'
require 'open-uri'

output = File.new('titles.txt', 'w+')

titles = []

doc1 = Nokogiri::HTML(open('http://ee24.com/'))
doc2 = Nokogiri::HTML(open('http://www.core-me.com/'))

titles << doc1.title
titles << doc2.title

output.write(titles)

puts titles
