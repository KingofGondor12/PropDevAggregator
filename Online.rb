# Marketing/Propery Development Aggregator App
# --------------------------------------------

# Gems required
require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

# Create the output file
output = File.new('output.txt', 'w+')

# Array of all URLs
links = [
  'http://ee24.com/',
  'http://www.core-me.com/',
  'http://off-planproperties.ae/',
  'https://www.theurbandeveloper.com/',
  'https://www.reidin.com/en-AE',
  # 'https://www.masterbuilders.com.au/',
  'https://propertyeu.info/',
  'https://europroperty.com/',
  'https://pie-mag.com/',
  'https://www.asteco.com/',
]

# Array of crawled results
results = []

# Web crawler logic
links.each do |url|
  @doc = Nokogiri::HTML(open(url))
  @title = @doc.xpath('//head//title/text()').first.text
  if @doc.xpath('//img')
    @image = @doc.xpath('//img//@src').first.content
  end
  results << {name: @title, image: @image}
end

# Output all crawled data to text file
output.write(results)

# Prints contents of titles and images arrays to the screen
puts results
