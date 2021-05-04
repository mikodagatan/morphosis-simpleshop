FactoryBot.define do
  factory :user, aliases: [:customer] do
    first_name { "John" }
    last_name { "Smith" }
    email { "john.smith@email.com" }
    password { "password123" }
  end
end
