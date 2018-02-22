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
  key = 0

  # Off Plan Properties - The World Islands Function

  @off_plan_twi = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/the-world-islands/"))

  @off_plan_image_search_twi = @off_plan_twi.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_twi = @off_plan_twi.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_twi = @off_plan_twi.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

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
  #
  # @off_plan_description_twi = []
  #
  # @off_plan_links_twi.each do |p|
  #   @crawl_twi = Nokogiri::HTML(open(p))
  #   @one_twi = @crawl_twi.xpath('//div[contains(@class,"description")]//p').first
  #   @off_plan_description_twi << @one_twi.text.gsub("\u00A0", " ")
  # end

  off_plan_count_twi = 0

  @off_plan_titles_twi.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_twi[off_plan_count_twi].value,
      url: @off_plan_links_twi[off_plan_count_twi].value,
      # description: @off_plan_description_twi[off_plan_count_twi],
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "The World Islands"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_twi = off_plan_count_twi + 1
    key = key + 1
  end

  # Off Plan Properties - Sheikh Zayed Road Function

  @off_plan_szr = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/sheikh-zayed-road/"))

  @off_plan_image_search_szr = @off_plan_szr.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_szr = @off_plan_szr.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_szr = @off_plan_szr.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

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

  # @off_plan_description_szr = []
  #
  # @off_plan_links_szr.each do |p|
  #   @crawl_szr = Nokogiri::HTML(open(p))
  #   @one_szr = @crawl_szr.xpath('//div[contains(@class,"description")]//p').first
  #   @off_plan_description_szr << @one_szr.text.gsub(/\u2019|\u2018|\u00A0/, ' ')
  # end

  off_plan_count_szr = 0

  @off_plan_titles_szr.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_szr[off_plan_count_szr].value,
      url: @off_plan_links_szr[off_plan_count_szr].value,
      # description: @off_plan_description_szr[off_plan_count_szr],
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Sheikh Zayed Road"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_szr = off_plan_count_szr + 1
    key = key + 1
  end

  # Off Plan Properties - Marina Function

  @off_plan_marina = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-marina/"))

  @off_plan_image_search_marina = @off_plan_marina.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_marina = @off_plan_marina.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_marina = @off_plan_marina.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

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
    @off_plan_links_marina << link.to_s.strip
  end

  # @off_plan_description_marina = []
  #
  # @off_plan_links_marina.each do |p|
  #   @crawl_marina = Nokogiri::HTML(open(p))
  #   @one_marina = @crawl_marina.xpath('//div[contains(@class,"description")]//p').first
  #     if @one_marina == nil
  #       @off_plan_description_marina << ""
  #     else
  #       @off_plan_description_marina << @one_marina.text
  #     end
  # end

  off_plan_count_marina = 0
  @off_plan_titles_marina.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_marina[off_plan_count_marina].value,
      url: @off_plan_links_marina[off_plan_count_marina],
      # description: @off_plan_description_marina[off_plan_count_marina],
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Marina"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_marina = off_plan_count_marina + 1
    key = key + 1
  end

  # Off Plan Properties - Downtown Function

  @off_plan_downtown = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/downtown-dubai/"))

  @off_plan_image_search_downtown = @off_plan_downtown.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_downtown = @off_plan_downtown.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_downtown = @off_plan_downtown.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

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
  #
  # @off_plan_description_downtown = []
  #
  # @off_plan_links_downtown.each do |p|
  #   @crawl_downtown = Nokogiri::HTML(open(p))
  #   @one_downtown = @crawl_downtown.xpath('//div[contains(@class,"description")]//p').first
  #   @off_plan_description_downtown << @one_downtown.text
  # end

  off_plan_count_downtown = 0
  @off_plan_titles_downtown.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_downtown[off_plan_count_downtown].value,
      url: @off_plan_links_downtown[off_plan_count_downtown].value,
      # description: @off_plan_description_downtown[off_plan_count_downtown],
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Downtown"],
      type: "Development",
      code: "ae"}
    off_plan_count_downtown = off_plan_count_downtown + 1
    key = key + 1
  end

  # Off Plan Properties - Dubailand Function

  @off_plan_dubailand = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-land/"))

  @off_plan_image_search_dubailand = @off_plan_dubailand.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_dubailand = @off_plan_dubailand.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_dubailand = @off_plan_dubailand.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

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
    results << {
      key: key,
      name: title,
      image: @off_plan_images_dubailand[off_plan_count_dubailand].value,
      url: @off_plan_links_dubailand[off_plan_count_dubailand].value,
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Dubailand"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_dubailand = off_plan_count_dubailand + 1
    key = key + 1
  end

  # Off Plan Properties - Jumeirah Dubai

  @off_plan_jumeirah = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/jumeirah/"))

  @off_plan_image_search_jumeirah = @off_plan_jumeirah.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_jumeirah = @off_plan_jumeirah.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_jumeirah = @off_plan_jumeirah.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

  @off_plan_titles_jumeirah = []

  @off_plan_title_search_jumeirah.each do |a|
    @off_plan_titles_jumeirah << a.inner_text
  end

  @off_plan_images_jumeirah = []

  @off_plan_image_search_jumeirah.each do |img|
    @off_plan_images_jumeirah << img
  end

  @off_plan_links_jumeirah = []

  @off_plan_link_search_jumeirah.each do |link|
    @off_plan_links_jumeirah << link
  end

  off_plan_count_jumeirah = 0
  @off_plan_titles_jumeirah.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_jumeirah[off_plan_count_jumeirah].value,
      url: @off_plan_links_jumeirah[off_plan_count_jumeirah].value,
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Jumeirah"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_jumeirah = off_plan_count_jumeirah + 1
    key = key + 1
  end

  # Off Plan Properties - Palm Jumeirah

  @off_plan_palm_jumeirah = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/palm-jumeirah/"))

  @off_plan_image_search_palm_jumeirah = @off_plan_palm_jumeirah.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  @off_plan_title_search_palm_jumeirah = @off_plan_palm_jumeirah.xpath('//div[contains(@class,"project-grid")]//h4/a')
  @off_plan_link_search_palm_jumeirah = @off_plan_palm_jumeirah.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')

  @off_plan_titles_palm_jumeirah = []

  @off_plan_title_search_palm_jumeirah.each do |a|
    @off_plan_titles_palm_jumeirah << a.inner_text
  end

  @off_plan_images_palm_jumeirah = []

  @off_plan_image_search_palm_jumeirah.each do |img|
    @off_plan_images_palm_jumeirah << img
  end

  @off_plan_links_palm_jumeirah = []

  @off_plan_link_search_palm_jumeirah.each do |link|
    @off_plan_links_palm_jumeirah << link
  end

  off_plan_count_palm_jumeirah = 0
  @off_plan_titles_palm_jumeirah.each do |title|
    results << {
      key: key,
      name: title,
      image: @off_plan_images_palm_jumeirah[off_plan_count_palm_jumeirah].value,
      url: @off_plan_links_palm_jumeirah[off_plan_count_palm_jumeirah].value,
      tag: ["Dubai", "United Arab Emirates", "Middle-East", "Palm Jumeirah"],
      type: "Development",
      code: "ae"
    }
    off_plan_count_palm_jumeirah = off_plan_count_palm_jumeirah + 1
    key = key + 1
  end

  # # Off Plan Properties - Jumeirah Golf
  #
  # @off_plan_jumeirah_golf = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/jumeirah-golf-estates/"))
  #
  # @off_plan_image_search_jumeirah_golf = @off_plan_jumeirah_golf.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_jumeirah_golf = @off_plan_jumeirah_golf.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_jumeirah_golf = @off_plan_jumeirah_golf.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_jumeirah_golf = []
  #
  # @off_plan_title_search_jumeirah_golf.each do |a|
  #   @off_plan_titles_jumeirah_golf << a.inner_text
  # end
  #
  # @off_plan_images_jumeirah_golf = []
  #
  # @off_plan_image_search_jumeirah_golf.each do |img|
  #   @off_plan_images_jumeirah_golf << img
  # end
  #
  # @off_plan_links_jumeirah_golf = []
  #
  # @off_plan_link_search_jumeirah_golf.each do |link|
  #   @off_plan_links_jumeirah_golf << link
  # end
  #
  # off_plan_count_jumeirah_golf = 0
  # @off_plan_titles_jumeirah_golf.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_jumeirah_golf[off_plan_count_jumeirah_golf].value,
  #     url: @off_plan_links_jumeirah_golf[off_plan_count_jumeirah_golf].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Jumeirah Golf"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_jumeirah_golf = off_plan_count_jumeirah_golf + 1
  #   key = key + 1
  # end

# *** WORKS TO HERE! *** #

  # Off Plan Properties - Dubai Meydan City
  #
  # @off_plan_meydan = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-meydan-city/"))
  #
  # @off_plan_image_search_meydan = @off_plan_meydan.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_meydan = @off_plan_meydan.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_meydan = @off_plan_meydan.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_meydan = []
  #
  # @off_plan_title_search_meydan.each do |a|
  #   @off_plan_titles_meydan << a.inner_text
  # end
  #
  # @off_plan_images_meydan = []
  #
  # @off_plan_image_search_meydan.each do |img|
  #   @off_plan_images_meydan << img
  # end
  #
  # @off_plan_links_meydan = []
  #
  # @off_plan_link_search_meydan.each do |link|
  #   @off_plan_links_meydan << link
  # end
  #
  # off_plan_count_meydan = 0
  # @off_plan_titles_meydan.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_meydan[off_plan_count_meydan].value,
  #     url: @off_plan_links_meydan[off_plan_count_meydan].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Meydan"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_meydan = off_plan_count_meydan + 1
  #   key = key + 1
  # end

  # Off Plan Properties - Arabian Ranches
  #
  # @off_plan_arabian_ranches = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/arabian-ranches/"))
  #
  # @off_plan_image_search_arabian_ranches = @off_plan_arabian_ranches.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_arabian_ranches = @off_plan_arabian_ranches.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_arabian_ranches = @off_plan_arabian_ranches.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_arabian_ranches = []
  #
  # @off_plan_title_search_arabian_ranches.each do |a|
  #   @off_plan_titles_arabian_ranches << a.inner_text
  # end
  #
  # @off_plan_images_arabian_ranches = []
  #
  # @off_plan_image_search_arabian_ranches.each do |img|
  #   @off_plan_images_arabian_ranches << img
  # end
  #
  # @off_plan_links_arabian_ranches = []
  #
  # @off_plan_link_search_arabian_ranches.each do |link|
  #   @off_plan_links_arabian_ranches << link
  # end
  #
  # off_plan_count_arabian_ranches = 0
  # @off_plan_titles_arabian_ranches.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_arabian_ranches[off_plan_count_arabian_ranches].value,
  #     url: @off_plan_links_arabian_ranches[off_plan_count_arabian_ranches].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Arabian Ranches"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_arabian_ranches = off_plan_count_arabian_ranches + 1
  #   key = key + 1
  # end

  # # Off Plan Properties - Business Bay
  #
  # @off_plan_business_bay = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/business-bay/"))
  #
  # @off_plan_image_search_business_bay = @off_plan_business_bay.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_business_bay = @off_plan_business_bay.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_business_bay = @off_plan_business_bay.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_business_bay = []
  #
  # @off_plan_title_search_business_bay.each do |a|
  #   @off_plan_titles_business_bay << a.inner_text
  # end
  #
  # @off_plan_images_business_bay = []
  #
  # @off_plan_image_search_business_bay.each do |img|
  #   @off_plan_images_business_bay << img
  # end
  #
  # @off_plan_links_business_bay = []
  #
  # @off_plan_link_search_business_bay.each do |link|
  #   @off_plan_links_business_bay << link
  # end
  #
  # off_plan_count_business_bay = 0
  # @off_plan_titles_business_bay.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_business_bay[off_plan_count_business_bay].value,
  #     url: @off_plan_links_business_bay[off_plan_count_business_bay].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Business Bay"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_business_bay = off_plan_count_business_bay + 1
  #   key = key + 1
  # end

  # Off Plan Properties - Hills Estate
  #
  # @off_plan_hills_estate = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-hills-estate/"))
  #
  # @off_plan_image_search_hills_estate = @off_plan_hills_estate.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_hills_estate = @off_plan_hills_estate.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_hills_estate = @off_plan_hills_estate.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_hills_estate = []
  #
  # @off_plan_title_search_hills_estate.each do |a|
  #   @off_plan_titles_hills_estate << a.inner_text
  # end
  #
  # @off_plan_images_hills_estate = []
  #
  # @off_plan_image_search_hills_estate.each do |img|
  #   @off_plan_images_hills_estate << img
  # end
  #
  # @off_plan_links_hills_estate = []
  #
  # @off_plan_link_search_hills_estate.each do |link|
  #   @off_plan_links_hills_estate << link
  # end
  #
  # off_plan_count_hills_estate = 0
  # @off_plan_titles_hills_estate.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_hills_estate[off_plan_count_hills_estate].value,
  #     url: @off_plan_links_hills_estate[off_plan_count_hills_estate].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Hills Estate"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_hills_estate = off_plan_count_hills_estate + 1
  #   key = key + 1
  # end

  # Off Plan Properties - Creek Harbour – The Lagoons

  # @off_plan_creek_harbour = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-creek-harbour-the-lagoons/"))
  #
  # @off_plan_image_search_creek_harbour = @off_plan_creek_harbour.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_creek_harbour = @off_plan_creek_harbour.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_creek_harbour = @off_plan_creek_harbour.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_creek_harbour = []
  #
  # @off_plan_title_search_creek_harbour.each do |a|
  #   @off_plan_titles_creek_harbour << a.inner_text
  # end
  #
  # @off_plan_images_creek_harbour = []
  #
  # @off_plan_image_search_creek_harbour.each do |img|
  #   @off_plan_images_creek_harbour << img
  # end
  #
  # @off_plan_links_creek_harbour = []
  #
  # @off_plan_link_search_creek_harbour.each do |link|
  #   @off_plan_links_creek_harbour << link
  # end
  #
  # off_plan_count_creek_harbour = 0
  # @off_plan_titles_creek_harbour.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_creek_harbour[off_plan_count_creek_harbour].value,
  #     url: @off_plan_links_creek_harbour[off_plan_count_creek_harbour].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Creek Harbour – Lagoons"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_creek_harbour = off_plan_count_creek_harbour + 1
  #   key = key + 1
  # end

  # Off Plan Properties - Dubai South

  # @off_plan_south = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/dubai-south-projects/"))
  #
  # @off_plan_image_search_south = @off_plan_south.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_south = @off_plan_south.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_south = @off_plan_south.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_south = []
  #
  # @off_plan_title_search_south.each do |a|
  #   @off_plan_titles_south << a.inner_text
  # end
  #
  # @off_plan_images_south = []
  #
  # @off_plan_image_search_south.each do |img|
  #   @off_plan_images_south << img
  # end
  #
  # @off_plan_links_south = []
  #
  # @off_plan_link_search_south.each do |link|
  #   @off_plan_links_south << link
  # end
  #
  # off_plan_count_south = 0
  # @off_plan_titles_south.each do |title|
  #   results << {
  #     name: title,
  #     image: @off_plan_images_south[off_plan_count_south].value,
  #     url: @off_plan_links_south[off_plan_count_south].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "South"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_south = off_plan_count_south + 1
  # end
  #
  # # Off Plan Properties - Al Furjan
  #
  # @off_plan_al_furjan = Nokogiri::HTML(open("https://offplan-properties.ae/buy-new-projects-dubai/al-furjan/"))
  #
  # @off_plan_image_search_al_furjan = @off_plan_al_furjan.xpath('//div[contains(@class,"project-grid")]//a/img/@src')
  # @off_plan_title_search_al_furjan = @off_plan_al_furjan.xpath('//div[contains(@class,"project-grid")]//h4/a')
  # @off_plan_link_search_al_furjan = @off_plan_al_furjan.xpath('//div[contains(@class,"project-grid")]//h4/a/@href')
  #
  # @off_plan_titles_al_furjan = []
  #
  # @off_plan_title_search_al_furjan.each do |a|
  #   @off_plan_titles_al_furjan << a.inner_text
  # end
  #
  # @off_plan_images_al_furjan = []
  #
  # @off_plan_image_search_al_furjan.each do |img|
  #   @off_plan_images_al_furjan << img
  # end
  #
  # @off_plan_links_al_furjan = []
  #
  # @off_plan_link_search_al_furjan.each do |link|
  #   @off_plan_links_al_furjan << link
  # end
  #
  # off_plan_count_al_furjan = 0
  # @off_plan_titles_al_furjan.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @off_plan_images_al_furjan[off_plan_count_al_furjan].value,
  #     url: @off_plan_links_al_furjan[off_plan_count_al_furjan].value,
  #     tag: ["Dubai", "United Arab Emirates", "Middle-East", "Creek Harbour – Lagoons"],
  #     type: "Development",
  #     code: "ae"
  #   }
  #   off_plan_count_al_furjan = off_plan_count_al_furjan + 1
  #   key = key + 1
  # end

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
    results << {
      key: key,
      name: title,
      image: @urban_images[urban_count].value,
      url: @urban_links[urban_count],
      tag: ["Australia", "Oceania"],
      type: "Article",
      code: "au"
    }
    urban_count = urban_count + 1
    key = key + 1
  end

  # TheUrbanDeveloper Commercial

  @urban = Nokogiri::HTML(open("https://theurbandeveloper.com/category/Commercial"))

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
    results << {
      key: key,
      name: title,
      image: @urban_images[urban_count].value,
      url: @urban_links[urban_count],
      tag: ["Australia", "Oceania", "Commercial"],
      type: "Article",
      code: "au"
    }
    urban_count = urban_count + 1
    key = key + 1
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
    results << {
      key: key,
      name: title,
      image: @ris_images[ris_count].value,
      url: @ris_links[ris_count],
      tag: ["America", "United States", "United States of America", "North America"],
      type: "Article",
      code: "us"
    }
    ris_count = ris_count + 1
    key = key + 1
  end

  # Curbed
  #
  # @curbed = Nokogiri::HTML(open("https://www.curbed.com/"))
  #
  # @curbed_title_search = @curbed.xpath('//body/div[3]/div[6]//div[@class="c-compact-river"]/div/div[@class="c-entry-box--compact c-entry-box--compact--article"]//h2/a')
  # @curbed_image_search = @curbed.xpath('//body/div[3]/div[6]//div[@class="c-compact-river"]/div/div[@class="c-entry-box--compact c-entry-box--compact--article"]/a//img/@src')
  # @curbed_link_search = @curbed.xpath('//body/div[3]/div[6]//div[@class="c-compact-river"]/div/div[@class="c-entry-box--compact c-entry-box--compact--article"]/a/@href')
  # @curbed_teaser_search = @curbed.xpath('//body/div[3]/div[6]//div[@class="c-compact-river"]/div/div[@class="c-entry-box--compact c-entry-box--compact--article"]//p')
  #
  # @curbed_titles = []
  #
  # @curbed_title_search.each do |div|
  #   @curbed_titles << div.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
  # end
  #
  # @curbed_images = []
  #
  # @curbed_image_search.each do |img|
  #   if img.content.slice(0, 4) == "http"
  #     @curbed_images << img
  #   end
  # end
  #
  # @curbed_links = []
  #
  # @curbed_link_search.each do |link|
  #   @curbed_links << link
  # end
  #
  # @curbed_teasers = []
  #
  # @curbed_title_search.each do |para|
  #   @curbed_teasers << para.inner_text.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ").strip
  # end
  #
  # curbed_count = 0
  # @curbed_titles.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @curbed_images[curbed_count].value,
  #     description: @curbed_teasers[curbed_count],
  #     url: @curbed_links[curbed_count],
  #     tag: ["America", "United States", "United States of America", "North America"],
  #     code: "us"
  #   }
  #   curbed_count = curbed_count + 1
  #   key = key + 1
  # end


  # # Colliers
  #
  # @colliers = Nokogiri::HTML(open("http://www.colliers.com/en-gb/china/"))
  #
  # @colliers_image_search = @colliers.xpath('//div[contains(@class,"slick-track")]//img/@src')
  # @colliers_title_search = @colliers.xpath('//article//h5')
  # @colliers_link_search = @colliers.xpath('//div[contains(@class,"blockLink")]//@href')
  # @colliers_description_search = @colliers.xpath('//article[contains(@class,"carouselArticle")]//@p[2]')
  #
  # @colliers_titles = []
  #
  # @colliers_title_search.each do |a|
  #   @colliers_titles << a.inner_text
  # end
  #
  # @colliers_images = []
  #
  # @colliers_image_search.each do |img|
  #   @colliers_images << "https://colliers.com + #{img}"
  # end
  #
  # @colliers_links = []
  #
  # @colliers_link_search.each do |link|
  #   @colliers_links << link
  # end
  #
  # @colliers_description = []
  #
  # @colliers_description_search.each do |p|
  #   @colliers_description << p
  # end
  #
  # colliers_count = 0
  # @colliers_titles.each do |title|
  #   results << {
  #     key: key,
  #     name: title,
  #     image: @colliers_images[colliers_count].value,
  #     url: @colliers_links[colliers_count].value,
  #     description: @colliers_description,
  #     tag: ["China", "Beijing"],
  #     type: "Development",
  #     code: "cn"
  #   }
  #   colliers_count = colliers_count + 1
  #   key = key + 1
  # end

  return results.to_json

end
