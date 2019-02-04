class CreateStockPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_prices do |t|
      t.date :date, null: false
      t.references :stock, foreign_key: true, index: false, null: false
      t.string :stock_code, null: false
      t.float :open
      t.float :close
      t.float :highest
      t.float :lowest
      t.float :adjusted_close
      t.integer :volume

      t.timestamps
    end

    add_index :stock_prices, [:stock_id, :date], unique: true
  end
end
