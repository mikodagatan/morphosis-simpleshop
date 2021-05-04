FactoryBot.define do
  factory :address do
    line1     { "line1" }
    line2     { "line2" }
    city      { "Bangkok" }
    state     { "Central Thailand" }
    postal_code { "10100" }
    region
    user
  end
end