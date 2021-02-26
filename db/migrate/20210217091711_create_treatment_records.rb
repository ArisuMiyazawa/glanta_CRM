class CreateTreatmentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :treatment_records do |t|
      t.string :gel_used
      t.integer :amount_of_money
      t.string :treatment_menu
      t.integer :remaining_number_of_pointcards
      t.integer :remaining_number_of_stones
      t.string :other
      t.string :customer_id
      t.string :reservation_id
      t.timestamps
    end
  end
end
