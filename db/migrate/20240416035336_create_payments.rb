class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :card_number
      t.string :cvv
      t.string :expiry_date

      t.timestamps
    end
  end
end
