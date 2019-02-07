FactoryBot.define do
  factory :settlement do
    date { "2019-02-07" }
    quarter { 1 }
    eps { 1.5 }
    expected_eps { 1.5 }
  end
end
