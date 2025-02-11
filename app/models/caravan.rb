# == Schema Information
#
# Table name: caravans
#
#  id             :bigint           not null, primary key
#  adventure      :string
#  exterior_color :string
#  interior_theme :string
#  name           :string
#  price          :decimal(10, 2)
#  size           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Caravan < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  validates :name, presence: true
  validates :size, presence: true
  validates :adventure, presence: true
  validates :exterior_color, presence: true
  validates :interior_theme, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image
end
