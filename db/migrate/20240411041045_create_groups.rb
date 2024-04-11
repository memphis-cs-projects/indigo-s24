class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :group_size
      t.string :adventure_location
      t.text :other_information
      t.timestamps
    end
  end
end
