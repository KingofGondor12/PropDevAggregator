require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

url = Nokogiri::HTML(open("https://www.reidin.com"))

div = url.xpath('//*[@id="carousel-1"]/div/div[1]').to_s

if div.include?('background-image:')
  temp = div.index('background-image:url(')
  temp2 = 'background-image:url('.length
end

array = []

for i in (temp+temp2)..div.length-1
  if div[i] == ')'
    break
  end
  array << div[i]
end

array = array.join('')

print array
