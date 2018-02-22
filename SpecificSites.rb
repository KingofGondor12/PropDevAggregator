require 'Nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'

output = File.new('SpecificOutput.txt', 'w+')

results = []

# Off Plan Properties - The World Islands Function

@off_plan_twi = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/the-world-islands/"))

@off_plan_image_search_twi = @off_plan_twi.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search_twi = @off_plan_twi.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')
@off_plan_link_search_twi = @off_plan_twi.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a/@href')

@off_plan_titles_twi = []

@off_plan_title_search_twi.each do |a|
  @off_plan_titles_twi << a.inner_text
end

@off_plan_images_twi = []

@off_plan_image_search_twi.each do |img|
  @off_plan_images_twi << img
end

@off_plan_links_twi = []

@off_plan_link_search_twi.each do |link|
  @off_plan_links_twi << link
end

off_plan_count_twi = 0
@off_plan_titles_twi.each do |title|
  results << {name: title, image: @off_plan_images_twi[off_plan_count_twi].value, url: @off_plan_links_twi[off_plan_count_twi].value}
  off_plan_count_twi = off_plan_count_twi + 1
end

# Off Plan Properties - Sheikh Zayed Road Function

@off_plan_szr = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/sheikh-zayed-road/"))

@off_plan_image_search_szr = @off_plan_szr.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search_szr = @off_plan_szr.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')
@off_plan_link_search_szr = @off_plan_szr.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a/@href')

@off_plan_titles_szr = []

@off_plan_title_search_szr.each do |a|
  @off_plan_titles_szr << a.inner_text
end

@off_plan_images_szr = []

@off_plan_image_search_szr.each do |img|
  @off_plan_images_szr << img
end

@off_plan_links_szr = []

@off_plan_link_search_szr.each do |link|
  @off_plan_links_szr << link
end

off_plan_count_szr = 0
@off_plan_titles_szr.each do |title|
  results << {name: title, image: @off_plan_images_szr[off_plan_count_szr].value, url: @off_plan_links_szr[off_plan_count_szr].value}
  off_plan_count_szr = off_plan_count_szr + 1
end

# Off Plan Properties - Marina Function

@off_plan_marina = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-marina/"))

@off_plan_image_search_marina = @off_plan_marina.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search_marina = @off_plan_marina.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')
@off_plan_link_search_marina = @off_plan_marina.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a/@href')

@off_plan_titles_marina = []

@off_plan_title_search_marina.each do |a|
  @off_plan_titles_marina << a.inner_text
end

@off_plan_images_marina = []

@off_plan_image_search_marina.each do |img|
  @off_plan_images_marina << img
end

@off_plan_links_marina = []

@off_plan_link_search_marina.each do |link|
  @off_plan_links_marina << link
end

off_plan_count_marina = 0
@off_plan_titles_marina.each do |title|
  results << {name: title, image: @off_plan_images_marina[off_plan_count_marina].value, url: @off_plan_links_marina[off_plan_count_marina].value}
  off_plan_count_marina = off_plan_count_marina + 1
end

# Off Plan Properties - Downtown Function

@off_plan_downtown = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/downtown-dubai/"))

@off_plan_image_search_downtown = @off_plan_downtown.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search_downtown = @off_plan_downtown.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')
@off_plan_link_search_downtown = @off_plan_downtown.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a/@href')

@off_plan_titles_downtown = []

@off_plan_title_search_downtown.each do |a|
  @off_plan_titles_downtown << a.inner_text
end

@off_plan_images_downtown = []

@off_plan_image_search_downtown.each do |img|
  @off_plan_images_downtown << img
end

@off_plan_links_downtown = []

@off_plan_link_search_downtown.each do |link|
  @off_plan_links_downtown << link
end

off_plan_count_downtown = 0
@off_plan_titles_downtown.each do |title|
  results << {name: title, image: @off_plan_images_downtown[off_plan_count_downtown].value, url: @off_plan_links_downtown[off_plan_count_downtown].value}
  off_plan_count_downtown = off_plan_count_downtown + 1
end

# Off Plan Properties - Dubailand Function

@off_plan_dubailand = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-land/"))

@off_plan_image_search_dubailand = @off_plan_dubailand.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]/div/div[@class="col-md-12 col-sm-12 col-xs-12"]/a/img/@src')
@off_plan_title_search_dubailand = @off_plan_dubailand.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a')
@off_plan_link_search_dubailand = @off_plan_dubailand.xpath('//div[@id="Projects"]/div/div/div[@class="col-md-4 col-sm-6 col-xs-12 text-center"]//h4/a/@href')

@off_plan_titles_dubailand = []

@off_plan_title_search_dubailand.each do |a|
  @off_plan_titles_dubailand << a.inner_text
end

@off_plan_images_dubailand = []

@off_plan_image_search_dubailand.each do |img|
  @off_plan_images_dubailand << img
end

@off_plan_links_dubailand = []

@off_plan_link_search_dubailand.each do |link|
  @off_plan_links_dubailand << link
end

off_plan_count_dubailand = 0
@off_plan_titles_dubailand.each do |title|
  results << {name: title, image: @off_plan_images_dubailand[off_plan_count_dubailand].value, url: @off_plan_links_dubailand[off_plan_count_dubailand].value}
  off_plan_count_dubailand = off_plan_count_dubailand + 1
end

# TheUrbanDeveloper Function

@urban = Nokogiri::HTML(open("https://theurbandeveloper.com/category/Real%20Estate"))

@urban_title_search = @urban.xpath('//div[@id="appBody"]//div[@class="category__body"]/a//div[@class="category-article-card__title"]')
@urban_image_search = @urban.xpath('//div[@id="appBody"]/div[@class="category-container"]//div[@class="category__body"]/a//img/@src')
@urban_link_search = @urban.xpath('//div[@id="appBody"]/div[@class="category-container"]//a/@href')

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

@urban_links = []

@urban_link_search.each do |link|
  if link.value.slice(0, 4) != "http"
    link = link.value.insert(0, "https://theurbandeveloper.com")
  end
  @urban_links << link
end

urban_count = 0
@urban_titles.each do |title|
  results << {name: title, image: @urban_images[urban_count].value, url: @urban_links[urban_count]}
  urban_count = urban_count + 1
end

# @europrop = Nokogiri::HTML(open("https://europroperty.com/news/category/Analysis/141"))
#
# @europrop_title_search = @europrop.xpath('//div[@class="container"]/div[@class="row"]/div[@class="col-sm-8"]/div[@class="row"]/div/a/div/h3')
# @europrop_image_search = @europrop.xpath('//div[@class="container"]/div[@class="row"]/div[@class="col-sm-8"]/div[@class="row"]/div/a//img/@src')
#
# @europrop_titles = []
#
# @europrop_title_search.each do |h3|
#   @europrop_titles << h3.inner_text
# end
#
# @europrop_images = []
#
# @europrop_image_search.each do |img|
#   @europrop_images << "https://europroperty.com#{img}"
# end
#
# europrop_count = 0
# @europrop_titles.each do |title|
#   results << {name: title, image: @europrop_images[europrop_count]}
#   europrop_count = europrop_count + 1
# end
#
# @ee24 = Nokogiri::HTML(open("http://ee24.com/daily/"))
#
# @ee24_title_search = @ee24.xpath('//div/div/div[@class="container"]//div[@class="grid js-masonry"]/article//h3/a')
# @ee24_image_search = @ee24.xpath('//div/div/div[@class="container"]//div[@class="grid js-masonry"]/article//figure/a/img/@src')
#
# @ee24_titles = []
#
# @ee24_title_search.each do |a|
#   @ee24_titles << a.inner_text
# end
#
# @ee24_images = []
#
# @ee24_image_search.each do |img|
#   @ee24_images << "http://ee24.com#{img}"
# end
#
# ee24_count = 0
# @ee24_titles.each do |title|
#   results << {name: title, image: @ee24_images[ee24_count]}
#   ee24_count = ee24_count + 1
# end
#
# @core = Nokogiri::HTML(open("http://www.core-me.com/latest-core-news.html"))
#
# @core_title_search = @core.xpath('//div[@id="content_area"]/ul/li/div[@class="core_news_details"]//h2')
# @core_image_search = @core.xpath('//div[@id="content_area"]/ul/li/div[@class="core_news_picture"]/a/img/@src')
#
# @core_titles = []
#
# @core_title_search.each do |a|
#   @core_titles << a.inner_text
# end
#
# @core_images = []
#
# @core_image_search.each do |img|
#   @core_images << img
# end
#
# core_count = 0
# @core_titles.each do |title|
#   if core_count < 11
#     results << {name: title, image: @core_images[core_count].value}
#     core_count = core_count + 1
#   end
# end

# Writing to outside file

output.write(results)

puts results
