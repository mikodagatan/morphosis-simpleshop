class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :address
  has_many   :product_orders
  has_many   :products, through: :product_orders
end
