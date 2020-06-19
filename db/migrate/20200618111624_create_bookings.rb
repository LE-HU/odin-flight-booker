class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :num_of_passengers
      t.references :flight, foreign_key: true
      t.timestamps
    end
  end
end
