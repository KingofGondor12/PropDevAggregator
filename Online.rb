require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

results = []

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
  @title = @doc.xpath('//head//title').first.text
  if @doc.xpath('//img')
    @image = @doc.xpath('//img').first
  end
  results << {name: @title, logo: @image}
end

output.write(results)

puts results
