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
require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
