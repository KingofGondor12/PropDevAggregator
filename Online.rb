# Marketing/Propery Development Aggregator App
# --------------------------------------------

# Gems required
require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'
require 'image_size'

# Create the output file
output = File.new('output.txt', 'w+')

# Array of all URLs
links = [
  'http://ee24.com',
  'http://www.core-me.com',
  'http://off-planproperties.ae',
  'https://theurbandeveloper.com',
  'https://www.reidin.com/en-AE',
  # 'https://www.masterbuilders.com.au/', creates incorrect header check error
  'https://propertyeu.info',
  'https://europroperty.com',
  'https://pie-mag.com',
  'https://www.asteco.com'
]

# Array of crawled results
results = []

# Web crawler logic
links.each do |url|
  @imagesArray = []
  @doc = Nokogiri::HTML(open(url))
  @title = @doc.xpath('//head//title').first.content
  @title = @title.squeeze(" ").gsub(/[^a-zA-Z0-9. ]/, '')
  if @title[0] == " "
    @title = @title.strip
  end
  # @images = @doc.xpath('//img//@src')
  @images = @doc.xpath(substring-before(substring-after('//div/@style', "background-image: url('"), "')"))

  puts @images

  # @images.each do |image|
  #   if image.content.slice(0, 4) != "http"
  #     image = "#{url}#{image.content}"
  #     if image.slice(-3, 3) == 'jpg'
  #       # @size_test = ImageSize.path(image)
  #       # if @size_test.width >= 1024 && @size_test.height >= 768
  #         @imagesArray << image
  #       # end
  #     end
  #   end
  # end
  # results << {name: @title, images: @imagesArray}
end

# Output all crawled data to text file
# output.write(results)
#
# # Prints contents of titles and images arrays to the screen
# puts results
