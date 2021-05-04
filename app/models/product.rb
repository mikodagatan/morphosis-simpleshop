# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text
#  image       :string
#  price       :decimal(15, 2)
#  sku         :string
#  stock       :integer          default(0), not null
#  region_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to    :region
  has_many      :product_orders
  has_many      :orders, through: :product_orders
  
  validates     :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates     :stock, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates     :region_id, presence: true
end
