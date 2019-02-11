require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is valid with a code, name" do
    expect(FactoryBot.build(:stock)).to be_valid
  end

  it "is invalid without a code" do
    stock = FactoryBot.build(:stock, code: nil)
    stock.valid?
    expect(stock.errors[:code]).to include("can't be blank")
  end

  it "is invalid without a name" do
    stock = FactoryBot.build(:stock, name: nil)
    stock.valid?
    expect(stock.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate code" do
    FactoryBot.create(:stock)
    dup_stock = FactoryBot.build(:stock, code: "1000")
    dup_stock.valid?
    expect(dup_stock.errors[:code]).to include("has already been taken")
  end
end
