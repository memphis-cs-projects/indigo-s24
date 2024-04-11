# == Schema Information
#
# Table name: groups
#
#  id                 :bigint           not null, primary key
#  adventure_location :string
#  group_name         :string
#  group_size         :integer
#  other_information  :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Group < ApplicationRecord

    # Attributes
  attr_accessor :group_name, :group_size, :adventure_location, :other_information

    validates :group_name, presence: true
    validates :group_size, presence: true, numericality: { only_integer: true }
    validates :adventure_location, presence: true
  end
  
