# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  reference_code :string
#  total          :decimal(14, 2)
#  customer_id    :integer          not null
#  address_id     :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Order < ApplicationRecord
  enum status: { 
    pending: 0, failed: 1, cancelled: 2, paid: 3, delivered: 4 
  }

  belongs_to  :customer, class_name: 'User'
  belongs_to  :address

  has_many    :product_orders
  has_many    :products, through: :product_orders

  validates   :status, presence: true
  validates   :customer_id, presence: true
  validates   :address_id, presence: true

end
