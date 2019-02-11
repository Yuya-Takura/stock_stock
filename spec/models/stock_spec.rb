require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is valid with a code, name" do
    stock = Stock.new(
      code: "2127",
      name: "日本M&Aセンター",
      url: "https://www.nihon-ma.co.jp/"
    )
    expect(stock).to be_valid
  end

  it "is invalid without a code" do
    stock = Stock.new(
      code: nil,
      name: "日本M&Aセンター",
      url: "https://www.nihon-ma.co.jp/"
    )
    stock.valid?
    expect(stock.errors[:code]).to include("can't be blank")
  end

  it "is invalid without a name" do
    stock = Stock.new(
      code: "2127",
      name: nil,
      url: "https://www.nihon-ma.co.jp/"
    )
    stock.valid?
    expect(stock.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate code" do
    Stock.create(
      code: "2127",
      name: "日本M&Aセンター",
      url: "https://www.nihon-ma.co.jp/"
    )

    dup_stock = Stock.new(
      code: "2127"
    )
    dup_stock.valid?
    expect(dup_stock.errors[:code]).to include("has already been taken")
  end
end
