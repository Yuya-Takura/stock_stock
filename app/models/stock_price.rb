class StockPrice < ApplicationRecord
  validates :date, presence: true
  validates :stock_id, presence: true
  validates :stock_code, presence: true
end
