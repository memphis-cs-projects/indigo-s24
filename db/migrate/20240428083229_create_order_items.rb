
# db/migrate/[timestamp]_create_order_items.rb
class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :caravan, null: false, foreign_key: true # Assuming caravans are the items being ordered
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
