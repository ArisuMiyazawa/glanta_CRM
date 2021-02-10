class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.string :guest_reservation_id
      t.string :customer_id
      t.timestamps
    end
  end
end
