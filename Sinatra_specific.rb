require 'sinatra'
require 'sinatra/cors'
require 'nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'
require 'json'

set :allow_origin, "http://localhost:3000"
set :allow_methods, "GET,HEAD,POST"
set :allow_headers, "content-type,if-modified-since"
set :expose_headers, "location,link"

get '/' do

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
    results << {name: title, image: @off_plan_images_twi[off_plan_count_twi].value, url: @off_plan_links_twi[off_plan_count_twi].value, tag: ["dubai", "United Arab Emirate", "Middle-East"]}
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
    results << {name: title, image: @off_plan_images_szr[off_plan_count_szr].value, url: @off_plan_links_szr[off_plan_count_szr].value, tag: ["dubai", "United Arab Emirate", "Middle-East"]}
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
    results << {name: title, image: @off_plan_images_marina[off_plan_count_marina].value, url: @off_plan_links_marina[off_plan_count_marina].value, tag: ["Dubai", "United Arab Emirate", "Middle-East"]}
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
    results << {name: title, image: @off_plan_images_downtown[off_plan_count_downtown].value, url: @off_plan_links_downtown[off_plan_count_downtown].value, tag: ["Dubai", "United Arab Emirate", "Middle-East"]}
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
    results << {name: title, image: @off_plan_images_dubailand[off_plan_count_dubailand].value, url: @off_plan_links_dubailand[off_plan_count_dubailand].value, tag: ["Dubai", "United Arab Emirate", "Middle-East"]}
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

  # RealtorMag

  @rm = Nokogiri::HTML(open("http://realtormag.realtor.org/daily-news"))

  @rm_title_search = @rm.xpath('//div[@id="op-content"]/div/div[@class="view-content"]/div[@class="item-list"]/ul//a')
  @rm_image_search = @rm.xpath('//div[@id="left-area"]/article//img/@src')
  @rm_link_search = @rm.xpath('//div[@id="op-content"]/div/div[@class="view-content"]/div[@class="item-list"]/ul//a/@href')
  @rm_snippet_search = @rm.xpath('//div[@id="op-content"]/div/div[@class="view-content"]/div[@class="item-list"]/ul/li/div[@class="views-field-field-teaser-value"]/div[@class="field-content"]')

  @rm_titles = []

  @rm_title_search.each do |div|
    @rm_titles << div.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
  end

  @rm_images = []

  @rm_image_search.each do |img|
    if img.content.slice(0, 4) == "http"
      @rm_images << img
    end
  end

  @rm_links = []

  @rm_link_search.each do |link|
    if link.value.slice(0, 4) != "http"
      link = link.value.insert(0, "https://rmmedia.com")
    end
    @rm_links << link
  end

  @rm_snippets = []

  @rm_snippet_search.each do |snippet|
    @rm_snippets << snippet.inner_text.strip
  end

  rm_count = 0
  @rm_titles.each do |title|
    results << {name: title, image: @rm_images[rm_count], url: @rm_links[rm_count], teaser: @rm_snippets[rm_count], tag: ["America", "United States", "United States of America", "North America"]}
    rm_count = rm_count + 1
  end

  # NREI

  @nrei = Nokogiri::HTML(open("http://www.nreionline.com/nrei-wire-0"))

  @nrei_title_search = @nrei.xpath('//div[@id="main_content"]/div[@class="topcontent-wrapper"]/div[@class="topcontent-left"]/article//div[@class="title"]/a')
  @nrei_image_search = @nrei.xpath('//div[@id="main_content"]//div[@class="topcontent-left"]/article/div[@class="img-container"]/a/img/@src')
  @nrei_link_search = @nrei.xpath('//div[@id="main_content"]/div[@class="topcontent-wrapper"]/div[@class="topcontent-left"]/article//div[@class="title"]/a/@href')
  @nrei_snippet_search = @nrei.xpath('//div[@id="main_content"]//div[@class="topcontent-left"]/article//div[@class="summary"]')

  @nrei_titles = []

  @nrei_title_search.each do |div|
    @nrei_titles << div.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
  end

  @nrei_images = []

  @nrei_image_search.each do |img|
    if img.content.slice(0, 4) == "http"
      @nrei_images << img
    end
  end

  @nrei_links = []

  @nrei_link_search.each do |link|
    if link.value.slice(0, 4) != "http"
      link = link.value.insert(0, "http://www.nreionline.com")
    end
    @nrei_links << link
  end

  @nrei_snippets = []

  @nrei_snippet_search.each do |snippet|
    @nrei_snippets << snippet.inner_text.strip
  end

  nrei_count = 0
  @nrei_titles.each do |title|
    results << {name: title, image: @nrei_images[nrei_count], url: @nrei_links[nrei_count], teaser: @nrei_snippets[nrei_count], tag: ["America", "United States", "United States of America", "North America"]}
    nrei_count = nrei_count + 1
  end

  # Realty Times

  @rt = Nokogiri::HTML(open("https://realtytimes.com/advicefromagents?rtmpage=null"))

  @rt_title_search = @rt.xpath('//div/div//h3/a')
  @rt_image_search = @rt.xpath('//div[@class="none"]')
  @rt_link_search = @rt.xpath('//div/div//h3/a/@onclick')
  @rt_snippet_search = @rt.xpath('//div[@class="none"]')

  @rt_titles = []

  @rt_title_search.each do |div|
    @rt_titles << div.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
  end

  @rt_images = []

  @rt_image_search.each do |img|
    if img.content.slice(0, 4) == "http"
      @rt_images << img
    end
  end

  @rt_links = []

  @rt_link_search.each do |link|

    array = []

    temp = link.value.index("(").to_i
    temp2 = "(".size.to_i
    temp3 = (temp + temp2)
    if link.value[temp3] == "'"
      for i in (temp3 + 1)..link.value.length-1
        if link.value[i] == "'"
          break
        end
        array << link.value[i]
      end
      link = array.join('').to_s
    end
    if link.slice(0, 4) != "http"
      link = link.insert(0, "http://www.realtytimes.com")
    end
    @rt_links << link
  end

  @rt_snippets = []

  @rt_snippet_search.each do |snippet|
    @rt_snippets << snippet.strip
  end

  rt_count = 0
  @rt_titles.each do |title|
    if rt_count < 20
      results << {name: title, image: @rt_images[rt_count], url: @rt_links[rt_count], teaser: @rt_snippets[rt_count], tag: ["America", "United States", "United States of America", "North America"]}
      rt_count = rt_count + 1
    end
  end


  return results.to_json

end
