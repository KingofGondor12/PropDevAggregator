require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('titles.txt', 'w+')

results = []

links = [
  'http://ee24.com',
  'http://www.core-me.com',
  'http://off-planproperties.ae',
  'https://www.theurbandeveloper.com',
  'https://www.reidin.com/en-AE',
  # 'https://www.masterbuilders.com.au/', creates incorrect header check error
  'https://propertyeu.info',
  'https://europroperty.com',
  'https://pie-mag.com',
  'https://www.asteco.com'
]

links.each do |url|
  @doc = Nokogiri::HTML(open(url))
  @title = @doc.xpath('//head//title').first.content
  @title = @title.squeeze(" ").gsub(/[^a-zA-Z0-9. ]/, '')
  if @title[0] == " "
    @title = @title.strip
  end
  if @doc.xpath('//img')
    @image = @doc.xpath('//img//@src').first.content
    if @image.slice(0, 4) != "http"
      @image = "#{url}#{@image}"
    end
  end
  results << {name: @title, logo: @image}
end

output.write(results)

puts results
