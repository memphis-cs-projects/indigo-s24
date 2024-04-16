class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
