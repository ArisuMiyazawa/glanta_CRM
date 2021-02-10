class CreateGuestReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_reservations do |t|
      t.string :name_kana
      t.string :phone_number
      t.integer :introducer_name
      t.timestamps
    end
  end
end
