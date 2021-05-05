# == Schema Information
#
# Table name: regions
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  code           :string           not null
#  currency       :string           not null
#  tax_percentage :decimal(5, 3)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Region < ApplicationRecord
  has_many :addresses
  has_many :users, through: :addresses
  has_many :orders, through: :users, source: :orders

  validates_presence_of :title, :code, :currency, :tax_percentage
end
