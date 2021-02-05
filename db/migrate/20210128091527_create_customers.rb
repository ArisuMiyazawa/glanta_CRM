class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :name_kana
      t.date :birthday
      t.string :job
      t.string :postcode
      t.string :street_address
      t.string :phone_number
      t.string :email
      t.string :line_id
      t.string :allergy
      t.integer :introducer_id
      t.string :request
      t.string :special_note
      t.integer :remaining_number_of_pointcards
      t.integer :remaining_number_of_stones
      t.timestamps
    end
  end
end
