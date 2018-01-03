class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :place_type
      t.string :property_type
      t.text :description
      t.string :address
      t.string :country
      t.string :state
      t.string :city
      t.integer :zipcode
      t.integer :price
      t.integer :guest_number
      t.integer :room_number
      t.integer :bed_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
