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

urban_count = 0
@urban_titles.each do |title|
  results << {name: title, image: @urban_images[urban_count].value}
  urban_count = urban_count + 1
end

@europrop = Nokogiri::HTML(open("https://europroperty.com/news/category/Analysis/141"))

@europrop_title_search = @europrop.xpath('//div[@class="container"]/div[@class="row"]/div[@class="col-sm-8"]/div[@class="row"]/div/a/div/h3')
@europrop_image_search = @europrop.xpath('//div[@class="container"]/div[@class="row"]/div[@class="col-sm-8"]/div[@class="row"]/div/a//img/@src')

@europrop_titles = []

@europrop_title_search.each do |h3|
  @europrop_titles << h3.inner_text
end

@europrop_images = []

@europrop_image_search.each do |img|
  @europrop_images << "https://europroperty.com#{img}"
end

europrop_count = 0
@europrop_titles.each do |title|
  results << {name: title, image: @europrop_images[europrop_count]}
  europrop_count = europrop_count + 1
end

@ee24 = Nokogiri::HTML(open("http://ee24.com/daily/"))

@ee24_title_search = @ee24.xpath('//div/div/div[@class="container"]//div[@class="grid js-masonry"]/article//h3/a')
@ee24_image_search = @ee24.xpath('//div/div/div[@class="container"]//div[@class="grid js-masonry"]/article//figure/a/img/@src')

@ee24_titles = []

@ee24_title_search.each do |a|
  @ee24_titles << a.inner_text
end

@ee24_images = []

@ee24_image_search.each do |img|
  @ee24_images << "http://ee24.com#{img}"
end

ee24_count = 0
@ee24_titles.each do |title|
  results << {name: title, image: @ee24_images[ee24_count]}
  ee24_count = ee24_count + 1
end

@core = Nokogiri::HTML(open("http://www.core-me.com/latest-core-news.html"))

@core_title_search = @core.xpath('//div[@id="content_area"]/ul/li/div[@class="core_news_details"]//h2')
@core_image_search = @core.xpath('//div[@id="content_area"]/ul/li/div[@class="core_news_picture"]/a/img/@src')

@core_titles = []

@core_title_search.each do |a|
  @core_titles << a.inner_text
end

@core_images = []

@core_image_search.each do |img|
  @core_images << img
end

core_count = 0
@core_titles.each do |title|
  if core_count < 11
    results << {name: title, image: @core_images[core_count].value}
    core_count = core_count + 1
  end
end

# Writing to outside file

output.write(results)

puts results
