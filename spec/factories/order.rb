FactoryBot.define do
  factory :order do
    reference_code    { "REFERENCE123" }
    total             { null }
    customer
    address
  end
end