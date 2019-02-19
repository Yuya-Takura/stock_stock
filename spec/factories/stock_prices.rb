FactoryBot.define do
  factory :stock_price do
    date {Date.today}
    stock_id {1}
    stock_code {"1000"}
  end
end
