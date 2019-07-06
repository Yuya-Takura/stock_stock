namespace :csv_import do
  desc "import stocks data 20181228"
  task import_stocks_data_20181228: :environment do
    CSV.foreach('db/csv/code_name_20181228.csv', headers: true) do |row|
      name = NKF.nkf('-Z1 -w', row[1])
      Stock.create(code: row[0], name: name)
    end
  end

  desc "import stock prices"
  task :import_stock_prices, ['code', 'year'] => :environment do |_, args|
    CSV.foreach("tmp/stock_price/#{args[:code]}/#{args[:code]}_#{args[:year]}.csv", headers: true ).with_index(0) do |row, i|
      next if i == 0
      StockPrice.create(
        date: row[0],
        stock_id: Stock.find_by(code: args[:code]).id,
        stock_code: args[:code],
        open: row[1],
        close: row[4],
        highest: row[2],
        lowest: row[3],
        adjusted_close: row[6],
        volume: row[5],
      )
    end
  end

  desc "import settlement data"
  task :import_settlement_data, ['code'] => :environment do |_, args|
    CSV.foreach("tmp/settlement/#{args[:code]}_settlement.csv", headers: true ) do |row|
      Settlement.create(
        stock_id: Stock.find_by(code: args[:code]).id,
        stock_code: args[:code],
        year: row[1],
        quarter: row[2],
        date: row[3],
        eps: row[4],
        expected_eps: row[5],
        )
    end
  end
end
