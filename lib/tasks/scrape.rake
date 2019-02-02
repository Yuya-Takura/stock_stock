namespace :scrape do
  desc "scrape url of stocks"
  task scrape_url_of_stock_info: :environment do
    Stock.all.each do |stock|
      url = Stock.scrape_url stock.code
      stock.update(url: url)
    end
  end
end
