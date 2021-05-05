FactoryBot.define do
  factory :region do
    title     { "Thailand" }
    code      { "TH" }
    currency  { "THB" }
    tax_percentage { 0.1 }
  end
end