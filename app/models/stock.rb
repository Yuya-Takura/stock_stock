class Stock < ApplicationRecord
  def self.scrape_url(code)
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36"

    stock = find_by(code: code)
    search_url = "https://www.google.co.jp/search?hl=jp&gl=JP&"
    query = URI.encode_www_form(q: "#{stock.name}")
    search_url += query

    charset = nil

    html = open(search_url, 'User-Agent' => user_agent) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    link = doc.xpath('//div[@class="r"]/a')
    link[0].attribute('href').text
  end
end
