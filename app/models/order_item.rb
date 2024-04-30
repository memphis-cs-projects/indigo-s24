# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(10, 2)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  caravan_id :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_order_items_on_caravan_id  (caravan_id)
#  index_order_items_on_order_id    (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (caravan_id => caravans.id)
#  fk_rails_...  (order_id => orders.id)
#
# app/models/order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :caravan # Assuming you are selling caravans
end
