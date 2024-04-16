# == Schema Information
#
# Table name: joined_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_joined_groups_on_group_id  (group_id)
#  index_joined_groups_on_user_id   (user_id)
#
class JoinedGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
