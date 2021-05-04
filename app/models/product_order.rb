# == Schema Information
#
# Table name: product_orders
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  subtotal   :decimal(14, 2)
#  product_id :bigint           not null
#  order_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
