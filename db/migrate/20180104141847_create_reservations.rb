class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true, index: true
      t.references :listing, foreign_key: true, index: true
      t.date :start_date
      t.date :end_date
      t.integer :num_guests
      t.timestamps
    end
  end
end
