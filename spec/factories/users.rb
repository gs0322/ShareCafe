FactoryBot.define do
  factory :user do
    name { 'sota' }
    sequence(:email) { |n| "sota#{n}@example.com" }
    password { 'password' }
  end
end
