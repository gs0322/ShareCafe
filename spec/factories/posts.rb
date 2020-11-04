FactoryBot.define do
  factory :post do
    association :user
    title { 'cafe' }
    text { 'おいしい' }
    img { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
    rate { '4' }
    address { '愛知県名古屋市守山区大字上志段味羽根５２８' }
    hashbody { '#名古屋'}
  end
end
