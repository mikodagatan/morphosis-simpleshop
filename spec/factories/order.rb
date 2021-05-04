FactoryBot.define do
  factory :order do
    reference_code    { "REFERENCE123" }
    total             { 0 }
    customer
    address
  end
end