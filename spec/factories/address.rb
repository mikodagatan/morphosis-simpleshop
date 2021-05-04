FactoryBot.define do
  factory :address do
    
    line2           { "village" }
    city            { "Bangkok" }
    state           { "Central Thailand" }
    postal_code     { "10100" }
    region
    user
    
    sequence(:line1) { |n| "#{n} sample street" }
  end
end