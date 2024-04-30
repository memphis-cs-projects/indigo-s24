# == Schema Information
#
# Table name: groups
#
#  id                 :bigint           not null, primary key
#  adventure_location :string
#  group_name         :string
#  group_size         :integer
#  other_information  :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Group < ApplicationRecord
  belongs_to :user
  has_many :messages


    validates :group_name, presence: true
    validates :group_size, presence: true, numericality: { only_integer: true }
    validates :adventure_location, presence: true
  end
