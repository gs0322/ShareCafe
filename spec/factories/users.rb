FactoryBot.define do
  factory :user do
    name { 'sota' }
    sequence(:email) { |n| "sota#{n}@example.com" }
    password { 'password' }
    img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
  end
end
