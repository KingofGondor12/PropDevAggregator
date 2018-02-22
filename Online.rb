# Marketing/Propery Development Aggregator App
# --------------------------------------------

# Gems required
require 'nokogiri'
require 'open-uri'
require 'net_http_ssl_fix'
require 'image_size'

# Create the output file
output = File.new('output.txt', 'w+')

# Array of all URLs
links = [
  'http://ee24.com',
  'http://www.core-me.com',
  'http://off-planproperties.ae',
  'https://theurbandeveloper.com',
  'https://www.reidin.com/en-AE',
  # 'https://www.masterbuilders.com.au/', creates incorrect header check error
  'https://propertyeu.info',
  'https://europroperty.com',
  'https://pie-mag.com',
  'https://www.asteco.com'
]

# Array of crawled results
results = []

# Web crawler logic
links.each do |url|
  @imagesArray = []
  @doc = Nokogiri::HTML(open(url))
  @title = @doc.xpath('//head//title').first.content
  @title = @title.gsub(/[^a-zA-Z0-9. ]/, '').squeeze(" ")

  if @title[0] == " "
    @title = @title.strip
  end

  @images = @doc.xpath('//img//@src')
  @divImages = @doc.xpath('//div//@style')

  @divImages.each do |div|
    div = div.to_s
    array = []
    if div.include?('background')
      temp = div.index("url(").to_i
      temp2 = "url(".size.to_i
      temp3 = (temp + temp2)

      if div[temp3] == "'"
        for i in (temp3 + 1)..div.length-1
          if div[i] == "'"
            break
          end
          array << div[i]
        end
        array = array.join('').to_s
        if !array.start_with?("http")
          image = array.insert(0, url)
        end
        image = array
      elsif div[temp3] == '"'
        for i in (temp3 + 1)..div.length-1
          if div[i] == '"'
            break
          end
          array << div[i]
        end
        array = array.join('').to_s
        if !array.start_with?("http")
          image = array.insert(0, url)
        end
        image = array
      else
        for i in temp3..div.length-1
          if div[i] == ")"
            break
          end
          array << div[i]
        end
        array = array.join('').to_s
        if !array.start_with?("http")
          image = array.insert(0, url)
        end
        image = array
      end
      if image.slice(-3, 3) == "jpg"
        @imagesArray << image
      elsif image.slice(-4, 4) == "jpeg"
        @imagesArray << image
      end
    end
  end

  @images.each do |image|
    if image.content.slice(0, 4) != "http"
      image = "#{url}#{image.content}"
      if image.slice(-3, 3) == 'jpg'
        # @size_test = ImageSize.path(image)
        # if @size_test.width >= 1024 && @size_test.height >= 768
          @imagesArray << image
        # end
      end
    end
  end
  results << {name: @title, images: @imagesArray}
end

# Output all crawled data to text file
output.write(results)

# Prints contents of titles and images arrays to the screen
puts results

# +10 Bonus Points for code not being a brothel
