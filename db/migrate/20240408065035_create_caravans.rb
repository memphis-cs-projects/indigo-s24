class CreateCaravans < ActiveRecord::Migration[7.0]
  def change
    create_table :caravans do |t|
      t.string :name
      t.string :size
      t.string :adventure
      t.string :exterior_color
      t.string :interior_theme
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
