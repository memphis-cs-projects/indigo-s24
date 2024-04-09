class Group < ApplicationRecord
    validates :group_name, presence: true
    validates :group_size, presence: true, numericality: { only_integer: true }
    validates :adventure_location, presence: true
  end
  