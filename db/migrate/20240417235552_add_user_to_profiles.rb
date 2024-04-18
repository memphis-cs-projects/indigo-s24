class AddUserToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :user, null: true, foreign_key: true
  end
end
