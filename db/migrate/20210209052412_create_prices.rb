class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :amount
      t.string :currency
      t.references :room_type, foreign_key: true

      t.timestamps
    end
  end
end
