require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

titles = []
images = []
links = [
  'http://ee24.com/',
  'http://www.core-me.com/',
  'http://off-planproperties.ae/',
  'https://www.theurbandeveloper.com/',
  'https://www.reidin.com/en-AE',
  # 'https://www.masterbuilders.com.au/', creates incorrect header check error
  'https://propertyeu.info/',
  'https://europroperty.com/',
  'https://pie-mag.com/',
  'https://www.asteco.com/'
]

links.each do |url|
  @doc = Nokogiri::HTML(open(url))
  titles << @doc.xpath('//head//title').first
  if @doc.xpath('//img')
    images << @doc.xpath('//img').first
  end
end

output.write(titles + images)

puts titles
puts images
