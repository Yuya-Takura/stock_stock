FactoryBot.define do
  factory :stock do
    code {"1000"}
    name {"日本工業"}

    trait :partial_matching_name do
      code {"2000"}
      name {"日本コンピュータ"}
    end

    trait :other_stock do
      code {"3000"}
      name {"米国ETF"}
    end
  end
end
