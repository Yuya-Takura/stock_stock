require 'rails_helper'

RSpec.describe Settlement, type: :model do
  it "is valid with params other than expected_eps" do
    expect(FactoryBot.build(:settlement)).to be_valid
  end

  it "is invalid without a stock id" do
    settlement = FactoryBot.build(:settlement, stock_id: nil)
    settlement.valid?
    expect(settlement.errors[:stock_id]).to include("can't be blank")
  end

  it "is invalid without a stock code" do
    settlement = FactoryBot.build(:settlement, stock_code: nil)
    settlement.valid?
    expect(settlement.errors[:stock_code]).to include("can't be blank")
  end

  it "is invalid without a year" do
    settlement = FactoryBot.build(:settlement, year: nil)
    settlement.valid?
    expect(settlement.errors[:year]).to include("can't be blank")
  end

  it "is invalid without a quarter" do
    settlement = FactoryBot.build(:settlement, quarter: nil)
    settlement.valid?
    expect(settlement.errors[:quarter]).to include("can't be blank")
  end

  it "is invalid, if quarter is less than 1" do
    settlement = FactoryBot.build(:settlement, quarter: 0)
    settlement.valid?
    expect(settlement.errors[:quarter]).to include("must be greater than or equal to 1")
  end

  it "is invalid, if quarter is greater than 4" do
    settlement = FactoryBot.build(:settlement, quarter: 5)
    settlement.valid?
    expect(settlement.errors[:quarter]).to include("must be less than or equal to 4")
  end

  it "is invalid without a date" do
    settlement = FactoryBot.build(:settlement, date: nil)
    settlement.valid?
    expect(settlement.errors[:date]).to include("can't be blank")
  end

  it "is invalid without a eps" do
    settlement = FactoryBot.build(:settlement, eps: nil)
    settlement.valid?
    expect(settlement.errors[:eps]).to include("can't be blank")
  end
end
