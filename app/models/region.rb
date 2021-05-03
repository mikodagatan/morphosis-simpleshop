class Region < ApplicationRecord
  validates_presence_of :title, :code, :currency, :tax_percentage
end
