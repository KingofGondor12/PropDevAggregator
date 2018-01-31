require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

titles = []
images = []
links = [
  'http://ee24.com',
  'http://www.core-me.com',
  'http://off-planproperties.ae',
  'https://www.theurbandeveloper.com',
]

links.each do |url|
  @doc = Nokogiri::HTML(open(url))
  titles << @doc.xpath('//head//title')
  if @doc.xpath('//img')
    images << @doc.xpath('//img').first
  end
end

output.write(titles + images)

puts titles
puts images
