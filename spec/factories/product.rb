FactoryBot.define do
  factory :product do
    title         { "Product" }
    description   { "Product Description" }
    image         { "https://picsum.photos/200" }
    price         { 1000 }
    sku           { "SKU" }
    stock         { 10 }
    region
  end
end