class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name, null: false
      t.string :code, unique: true, null: false

      t.timestamps
    end
    add_index :stocks, :code, unique: true
  end
end
