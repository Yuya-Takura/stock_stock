class AddColumnToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :url, :string
  end
end
