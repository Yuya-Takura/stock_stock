class Settlement < ApplicationRecord
  QUARTER_COUNT = {
      first: 1,
      second: 2,
      third: 3,
      fourth: 4,
  }.freeze

  validates :quarter, numericality: {
      :greater_than_or_equal_to => QUARTER_COUNT[:first],
      :less_than_or_equal_to => QUARTER_COUNT[:fourth],
  }
end
