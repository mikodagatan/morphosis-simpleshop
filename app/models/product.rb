class Product < ApplicationRecord
  belongs_to :region
  
  validates_presence_of :title, :stock, :region_id
  validates_length_of :title, minimum: 5, maximum: 255
  validates_numericality_of :stock, greater_than_or_equal_to: 0
end
