FactoryBot.define do
  factory :user, aliases: [:customer] do

    first_name { "John" }
    last_name { "Smith" }
    password { "password123" }

    sequence(:email) { |n| "#{n}@email.com" }
  end
end
