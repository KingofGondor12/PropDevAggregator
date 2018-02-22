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
  results << {name: title, image: @off_plan_images_twi[off_plan_count_twi].value, url: @off_plan_links_twi[off_plan_count_twi].value, tag: ["dubai", "United Arab Emirates", "Middle-East"]}
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
  results << {name: title, image: @off_plan_images_szr[off_plan_count_szr].value, url: @off_plan_links_szr[off_plan_count_szr].value, tag: ["dubai", "United Arab Emirates", "Middle-East"]}
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
  results << {name: title, image: @off_plan_images_marina[off_plan_count_marina].value, url: @off_plan_links_marina[off_plan_count_marina].value, tag: ["Dubai", "United Arab Emirates", "Middle-East"]}
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
  results << {name: title, image: @off_plan_images_downtown[off_plan_count_downtown].value, url: @off_plan_links_downtown[off_plan_count_downtown].value, tag: ["Dubai", "United Arab Emirates", "Middle-East"]}
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
  results << {name: title, image: @off_plan_images_dubailand[off_plan_count_dubailand].value, url: @off_plan_links_dubailand[off_plan_count_dubailand].value, tag: ["Dubai", "United Arab Emirates", "Middle-East"]}
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
  results << {name: title, image: @urban_images[urban_count].value, url: @urban_links[urban_count], tag: ["Australia", "Oceania"]}
  urban_count = urban_count + 1
end

# RIS Media

@ris = Nokogiri::HTML(open("http://rismedia.com/category/news/"))

@ris_title_search = @ris.xpath('//div[@id="left-area"]/article/h2[@class="entry-title"]/a')
@ris_image_search = @ris.xpath('//div[@id="left-area"]/article//img/@src')
@ris_link_search = @ris.xpath('//div[@id="left-area"]/article/a/@href')

@ris_titles = []

@ris_title_search.each do |div|
  @ris_titles << div.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
end

@ris_images = []

@ris_image_search.each do |img|
  if img.content.slice(0, 4) == "http"
    @ris_images << img
  end
end

@ris_links = []

@ris_link_search.each do |link|
  if link.value.slice(0, 4) != "http"
    link = link.value.insert(0, "https://rismedia.com")
  end
  @ris_links << link
end

ris_count = 0
@ris_titles.each do |title|
  results << {name: title, image: @ris_images[ris_count].value, url: @ris_links[ris_count], tag: ["America", "United States", "United States of America", "North America"]}
  ris_count = ris_count + 1
end

# Writing to outside file

output.write(results)

puts results
