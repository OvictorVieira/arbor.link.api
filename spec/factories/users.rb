FactoryBot.define do
  factory :user do
    email { "Joe" }
    password_digest { "password_123" }
  end
end
