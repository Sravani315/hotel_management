class CreateBooking < ActiveRecord::Migration[5.2]
  def change
    create_table :booking do |t|
      t.references :room, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamp :check_in
      t.timestamp :check_out
      
      t.timestamps
    end
  end
end
