require 'rails_helper'

RSpec.feature "Searches", type: :feature do
  # 証券コードで銘柄検索を行う
  scenario "user searches by stocks code" do
    visit root_path
    expect {
      fill_in ""
    }
  end
end
