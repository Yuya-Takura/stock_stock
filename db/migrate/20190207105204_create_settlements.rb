class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements do |t|
      t.references :stock, foreign_key: true, index: false, null: false
      t.string :stock_code, null: false
      t.integer :year, null: false
      t.integer :quarter, null: false
      t.date :date, null: false
      t.float :eps, null: false
      t.float :expected_eps

      t.timestamps
    end

    add_index :settlements, [:stock_id, :date], unique: true
  end
end
