require 'rails_helper'

RSpec.describe StockPrice, type: :model do
  it "is valid with params other than prices" do
    expect(FactoryBot.build(:stock_price)).to be_valid
  end
end
