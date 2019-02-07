class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements do |t|
      t.date :date
      t.references :stock, foreign_key: true, index: false, null: false
      t.string :stock_code, null: false
      t.integer :quarter
      t.float :eps
      t.float :expected_eps

      t.timestamps
    end

    add_index :settlements, [:stock_id, :date], unique: true
  end
end
