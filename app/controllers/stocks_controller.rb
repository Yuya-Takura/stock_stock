class StocksController < ApplicationController
  def show
    @stock = Stock.find(params[:id])
  end

  def search
    keyword = NKF.nkf('-Z1, -w', params[:keyword])
    @stocks = Stock.ransack(code_or_name_cont: keyword).result
  end
end
