require 'open-uri'
require 'nokogiri'
#require 'net_http_ssl_fix'
#require 'mechanize' # Gem to scrape websites that have logins. Not yet installed. 

# website = Nokogiri::XML(open('http://xrayproperty.com/Listing/CreateSalesAdvice_Step2_SalesAdviceDetails?ListingId=1436881&ClubId=88&UserId=0'))

# results = website.xpath('//div[id="main"]/div[id="tabs"]/div[id="tab-documents"]/div/table/tbody/tr/td/a/@href')


doc = Nokogiri::XML(File.open('File12.html'))

results = doc.xpath('//@href')
# results = doc.xpath('//div[id="main"]/div[id="tabs"]/div[id="tab-documents"]/div/table/tbody/tr/td/a/@href')

puts results 