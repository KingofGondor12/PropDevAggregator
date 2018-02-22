require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('SpecificOutput.txt', 'w+')

results = []

# Off Plan Properties Function

@off_plan = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-land/"))

@off_plan_image_search = @off_plan.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search = @off_plan.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')

@off_plan_titles = []

@off_plan_title_search.each do |a|
  @off_plan_titles << a.inner_text
end

@off_plan_images = []

@off_plan_image_search.each do |img|
  @off_plan_images << img
end

off_plan_count = 0
@off_plan_titles.each do |title|
  results << {name: title, image: @off_plan_images[off_plan_count].value}
  off_plan_count = off_plan_count + 1
end

# TheUrbanDeveloper Function

@urban = Nokogiri::HTML(open("https://theurbandeveloper.com/category/Real%20Estate"))

@urban_title_search = @urban.xpath('/html//div[@id="appBody"]//div[@class="category__body"]/a//div[@class="category-article-card__title"]')
@urban_image_search = @urban.xpath('//div[@id="appBody"]/div[@class="category-container"]//div[@class="category__body"]/a//img/@src')

@urban_titles = []

@urban_title_search.each do |div|
  @urban_titles << div.inner_text
end

@urban_images = []

@urban_image_search.each do |img|
  if img.content.slice(0, 4) == "http"
    @urban_images << img
  end
end

puts @urban_images

urban_count = 0
@urban_titles.each do |title|
  results << {name: title, image: @urban_images[urban_count].value}
  urban_count = urban_count + 1
end

output.write(results)

puts results
