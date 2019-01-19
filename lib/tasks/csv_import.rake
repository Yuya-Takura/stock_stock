namespace :csv_import do
  desc "import stocks data 20181228"
  task import_stocks_data_20181228: :environment do
    CSV.foreach('tmp/code_name_20181228.csv', headers: true) do |row|
      name = NKF.nkf('-Z1 -w', row[1])
      Stock.create(code: row[0], name: name)
    end
  end
end
