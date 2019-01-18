class StocksController < ApplicationController
  def search
    @stocks = Stock.ransack(code_or_name_cont: params[:keyword]).result
  end
end
