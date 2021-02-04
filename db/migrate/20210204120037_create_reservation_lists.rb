class CreateReservationLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_lists do |t|
      t.integer :customer_id
      t.string :name
      t.string :name_kana
      t.date :reservation_date
      t.time :reservation_time
      t.string :note
      t.timestamps
    end
  end
end
