class AddVerifiedColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :status, :integer, default: 0
  end
end
