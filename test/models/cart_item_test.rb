# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  caravan_id :bigint           not null
#  cart_id    :bigint           not null
#
# Indexes
#
#  index_cart_items_on_caravan_id  (caravan_id)
#  index_cart_items_on_cart_id     (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (caravan_id => caravans.id)
#  fk_rails_...  (cart_id => carts.id)
#
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
