class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :room_type, foreign_key: true
      t.string :room_no
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
