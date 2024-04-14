# db/migrate/[timestamp]_create_joined_groups.rb
class CreateJoinedGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :joined_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end

    add_index :joined_groups, :user_id
    add_index :joined_groups, :group_id
  end
end
