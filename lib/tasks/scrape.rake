namespace :scrape do
  desc "scrape url of stocks"
  task scrape_url_of_stock_info: :environment do
    Stock.all.each do |stock|
      url = Stock.scrape_url stock.code

      begin
        stock.update(url: url)
      rescue => e
        logger.info "Mistook url registration id=#{stock.id}, code=#{stock.code}, name=#{stock.name}"
        logger.info "#{e.message}"
      end

      sleep(10)
    end
  end
end
