# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  address      :string
#  email        :string
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Profile < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
