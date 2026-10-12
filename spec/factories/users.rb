FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end