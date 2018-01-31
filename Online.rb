require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

urls = [
  'http://ee24.com/',
  'http://www.core-me.com/',
  'http://off-planproperties.ae/',
  'https://www.theurbandeveloper.com/',
  'https://www.reidin.com/en-AE',
  'https://www.masterbuilders.com.au/',
  'https://propertyeu.info/',
  'https://europroperty.com/',
  'https://pie-mag.com/',
  'https://www.asteco.com/'
]

titles = []

doc1 = Nokogiri::HTML(open('http://ee24.com/'))
doc2 = Nokogiri::HTML(open('http://www.core-me.com/'))
doc3 = Nokogiri::HTML(open('http://off-planproperties.ae/'))
doc4 = Nokogiri::HTML(open('https://www.theurbandeveloper.com/'))
doc5 = Nokogiri::HTML(open('https://www.reidin.com/en-AE'))
# error with masterbuilders
# doc6 = Nokogiri::HTML(open('https://www.masterbuilders.com.au/'))
doc7 = Nokogiri::HTML(open('https://propertyeu.info/'))
doc8 = Nokogiri::HTML(open('https://europroperty.com/'))
doc9 = Nokogiri::HTML(open('https://pie-mag.com/'))
doc10 = Nokogiri::HTML(open('https://www.asteco.com/'))

titles << doc1.title
titles << doc2.title
titles << doc3.title
titles << doc4.title
titles << doc5.title
# titles << doc6.title
titles << doc7.title
titles << doc8.title
titles << doc9.title
titles << doc10.title

output.write(titles)

puts titles
