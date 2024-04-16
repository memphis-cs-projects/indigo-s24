# == Schema Information
#
# Table name: payments
#
#  id          :bigint           not null, primary key
#  card_number :string
#  cvv         :string
#  expiry_date :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Payment < ApplicationRecord
end
