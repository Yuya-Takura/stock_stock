class StocksController < ApplicationController
  def search
    keyword = NKF.nkf('-Z1, -w', params[:keyword])
    @stocks = Stock.ransack(code_or_name_cont: keyword).result
  end
end
