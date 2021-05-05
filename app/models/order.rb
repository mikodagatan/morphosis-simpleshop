# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  reference_code :string
#  total          :decimal(14, 2)
#  status         :integer
#  customer_id    :integer          not null
#  address_id     :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Order < ApplicationRecord
  # NOTE: To remove if will continue on project. Use Countries gem.
  include ActionView::Helpers::NumberHelper 
  
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

  before_update :adjust_products # ActiveModel::Dirty doesn't work on after_update

  def total_price
    number_to_currency(total, unit: address.region.currency )
  end

  private

  def adjust_products
    if status_changed?
      Payments::ProductAdjustments.new(self).call
      PaymentNotification.with(order: self).deliver(customer)
    end
  end 
end
