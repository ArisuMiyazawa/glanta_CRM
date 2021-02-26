class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.string :note
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
