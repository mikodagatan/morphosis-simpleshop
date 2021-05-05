FactoryBot.define do
  factory :product do
    
    description   { "Product Description" }
    image         { "https://picsum.photos/200" }
    price         { 1000 }
    sku           { "SKU" }
    stock         { 10 }
    region

    sequence(:title) { |n| "Product#{n}" }
  end
end