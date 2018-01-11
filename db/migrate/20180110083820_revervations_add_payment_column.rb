class RevervationsAddPaymentColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :payment, :integer, default: 0
  end
end