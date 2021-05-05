FactoryBot.define do
  factory :product_order do
    quantity    { 2 }
    subtotal    { null }
    product
    order
  end
end