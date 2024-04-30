# == Schema Information
#
# Table name: carts
#
#  id           :bigint           not null, primary key
#  shipping_fee :decimal(, )      default(5.99)
#  taxes        :decimal(, )      default(3.99)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
# app/models/cart.rb

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  SHIPPING_FEE = 5.99
  TAX_RATE = 3.99

  def add_caravan(caravan)
    current_item = cart_items.find_by(caravan_id: caravan.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(caravan: caravan, quantity: 1)
    end
    current_item.save if current_item.changed?
    current_item
  end

  def total_cost  
    items_cost = cart_items.sum do |item|
      item.quantity * item.caravan.price
    end
    items_cost + shipping_fee + taxes
  end

  def shipping_fee
    SHIPPING_FEE
  end

  def taxes
    TAX_RATE
  end

  def clear
    cart_items.destroy_all
  end
end
