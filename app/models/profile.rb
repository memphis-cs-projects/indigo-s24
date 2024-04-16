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
class Profile < ApplicationRecord
end
