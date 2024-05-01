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
#  user_id     :bigint
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  belongs_to :order, optional: true
end
