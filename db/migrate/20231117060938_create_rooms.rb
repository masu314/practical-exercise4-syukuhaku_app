class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :room_price
      t.string :room_introduction
      t.string :room_address
      t.string :room_image

      t.timestamps
    end
  end
end
