class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :user_num
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
