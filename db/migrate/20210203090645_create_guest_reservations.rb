class CreateGuestReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_reservations do |t|
      t.integer :customer_id
      t.string :name_kana
      t.string :phone_number
      t.date :reservation_date
      t.time :reservation_time
      t.integer :introducer_id
      t.timestamps
    end
  end
end
