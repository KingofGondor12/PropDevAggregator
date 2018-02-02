# Marketing/Propery Development Aggregator App
# --------------------------------------------

# Gems required
require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

# Create the output file
output = File.new('output.txt', 'w+')

# Array of all URLs
# links = [
#   'https://www.theurbandeveloper.com/category/Property%20Development',

# Array of crawled results
results = []

# Web crawler logic
@doc = Nokogiri::HTML(open('https://www.theurbandeveloper.com/category/Property%20Development'))
@image = @doc.xpath('//picture/img//@src').text
#   @title = @title.squeeze(" ").gsub(/[^a-zA-Z0-9. ]/, '')
#   if @title[0] == " "
#     @title = @title.strip
#   end
#   if @doc.xpath('//img')
#     @image = @doc.xpath('//img//@src').first.content
#     if @image.slice(0, 4) != "http"
#       @image = "#{url}#{@image}"
#     end
#   end
  results << {name: @title, image: @image}
# end

# Output all crawled data to text file
output.write(results)

# Prints contents of titles and images arrays to the screen
puts results
