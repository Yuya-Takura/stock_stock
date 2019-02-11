require 'rails_helper'

RSpec.feature "Searches", type: :feature do
  before do
    FactoryBot.create(:stock)
    FactoryBot.create(:stock, :partial_matching_name)
    FactoryBot.create(:stock, :other_stock)
  end

  # 証券コードで銘柄検索を行う
  scenario "user searches by stocks code" do
    visit root_path
    fill_in "keyword", with: "1000"
    click_button '検索'
    expect(page).to have_content "日本工業"
    expect(page).to_not have_content "日本コンピュータ"
    expect(page).to_not have_content "米国ETF"
  end

  # フリーワードで銘柄検索を行う
  scenario "user searches by stocks code" do
    visit root_path
    fill_in "keyword", with: "日本"
    click_button '検索'
    expect(page).to have_content "日本工業"
    expect(page).to have_content "日本コンピュータ"
    expect(page).to_not have_content "米国ETF"
  end
end
