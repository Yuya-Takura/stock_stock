class StaticPagesController < ApplicationController
  def index
    # 検索オブジェクト
    @search = Stock.ransack(params[:q])
    # 検索結果
    @products = @search.result
  end
end
