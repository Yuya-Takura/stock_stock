class Stock < ApplicationRecord
  def self.scrape_url(code)
    stock = find_by(code: code)
    search_url = "https://www.google.co.jp/search?hl=jp&gl=JP&"
    query = URI.encode_www_form(q: "#{stock.name}")
    search_url += query

    charset = nil

    html = open(search_url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    link = doc.xpath('//div[@class="hJND5c"]')
    link[0].child.text
  end
end
