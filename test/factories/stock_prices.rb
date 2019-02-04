FactoryBot.define do
  factory :stock_price do
    date { "2019-02-04" }
    stock_code { "MyString" }
    open { 1.5 }
    close { 1.5 }
    highest { 1.5 }
    lowest { 1.5 }
    adjusted_close { 1.5 }
    volume { "" }
  end
end
