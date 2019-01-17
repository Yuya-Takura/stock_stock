class StocksController < ApplicationController
  def search
    @search = Stock.ransack(code_or_name_cont: params[:keyword])
    @stocks = @search.result
  end
end
