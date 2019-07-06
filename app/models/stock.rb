class Stock < ApplicationRecord
  GOOGLE_SEARCH_URL = "https://www.google.co.jp/search?hl=jp&gl=JP&".freeze
  STOCK_PRICE_URL = "https://kabuoji3.com/stock/".freeze

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  def self.scrape_price(code)
    this_year = Time.now.strftime("%Y").to_i
    base_url = STOCK_PRICE_URL

    driver = create_chrome_driver

    # 西暦this_yearから年次のlist要素がなくなるまでループ
    this_year.times do |i|
      break if bool #表示中のページより前年度のボタンがない場合
      url = base_url + "#{code}/#{this_year - i}/"
      driver.navigate.to url
      # TODO:年次のCSVをダウンロード
      sleep 25
    end
  end

  def self.scrape_url(code)
    stock = find_by(code: code)
    search_url = GOOGLE_SEARCH_URL
    query = URI.encode_www_form(q: "#{stock.name}")
    search_url += query

    doc = get_nokogiri_html_doc(search_url)

    link = doc.xpath('//div[@class="r"]/a')
    link[0].attribute('href').text
  end

  private
  def user_agent
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36"
  end

  def get_nokogiri_html_doc(url)
    charset = nil

    html = open(url, 'User-Agent' => user_agent) do |f|
      charset = f.charset
      f.read
    end

    Nokogiri::HTML.parse(html, nil, charset)
  end

  def create_chrome_driver
    options = ::Selenium::WebDriver::Chrome::Options.new

    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1400,1400')

    Selenium::WebDriver.for :chrome, options: options
  end
end
