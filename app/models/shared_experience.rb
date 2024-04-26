# == Schema Information
#
# Table name: shared_experiences
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_shared_experiences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

# app/models/shared_experience.rb
class SharedExperience < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :description, presence: true
end
