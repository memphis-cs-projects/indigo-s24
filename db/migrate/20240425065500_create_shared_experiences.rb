class CreateSharedExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :shared_experiences do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
