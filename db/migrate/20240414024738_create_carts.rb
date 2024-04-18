class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :shipping_fee, default: 5.99
      t.decimal :taxes, default: 3.99

      t.timestamps
    end
  end

def set_defaults
  self.shipping_fee ||= 5.99
  self.taxes ||= 3.99
end
end
