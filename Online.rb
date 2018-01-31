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
  'https://www.asteco.com/'
]

# Array of crawled titles
titles = []

# Array of crawled image URLs
images = []

# Web crawler logic
links.each do |url|
  @doc = Nokogiri::HTML(open(url))
  titles << @doc.xpath('//head//title').first
  if @doc.xpath('//img')
    images << @doc.xpath('//img').first
  end
end

# Output all crawled data to text file
output.write(titles + images)

# Prints contents of titles and images arrays to the screen
puts titles + images
