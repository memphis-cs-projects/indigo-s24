# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  email        :string
#  name         :string
#  phone_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
