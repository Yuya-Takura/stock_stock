FactoryBot.define do
  factory :settlement do
    stock_id {1}
    stock_code {"1000"}
    year {2019}
    quarter {1}
    date {Date.today}
    eps {10.0}
  end
end
