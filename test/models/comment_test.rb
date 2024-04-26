# == Schema Information
#
# Table name: comments
#
#  id                   :bigint           not null, primary key
#  body                 :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  shared_experience_id :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_comments_on_shared_experience_id  (shared_experience_id)
#  index_comments_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shared_experience_id => shared_experiences.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
