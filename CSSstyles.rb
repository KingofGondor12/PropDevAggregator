require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

url = "https://www.reidin.com"

crawler = Nokogiri::HTML(open(url))

div = crawler.xpath('//*[@id="carousel-1"]/div/div[1]').to_s

bgimage = []
array = []

if div.include?('background-image:')
  temp = div.index('background-image:url(')
  temp2 = 'background-image:url('.length
  temp3 = temp + temp2
end

for i in temp3..div.length-1
  if div[i] == ')'
    break
  end
  array << div[i]
end

array = array.join('')

bgimage << { url: url, image: (url+array) }

# puts div
# puts temp
# puts temp2
# puts temp3

print bgimage
