FactoryBot.define do
  factory :product_order do
    quantity    { 2 }
    subtotal    { 0 }
    product
    order
  end
end