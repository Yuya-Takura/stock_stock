class Settlement < ApplicationRecord
  QUARTER_COUNT = {
      first:  1,
      second: 2,
      third:  3,
      fourth: 4,
  }.freeze

  validates :stock_id, presence: true
  validates :stock_code, presence: true
  validates :year, presence: true
  validates :quarter, presence: true, numericality: {
    :greater_than_or_equal_to => QUARTER_COUNT[:first],
    :less_than_or_equal_to => QUARTER_COUNT[:fourth],
  }
  validates :date, presence: true
  validates :eps, presence: true
end
