require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前とメールアドレスとパスワードがあれば登録できる' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it '名前がなければ登録できない' do
    expect(FactoryBot.build(:user, name: '')).to_not be_valid
  end

  it '名前が8文字以内でなければ登録できない' do
    expect(FactoryBot.build(:user, name: 'nicknames')).to_not be_valid
  end

  it '名前が8文字以内であれば登録できる' do
    expect(FactoryBot.build(:user, name: 'nickname')).to be_valid
  end

  it 'メールアドレスがなければ登録できない' do
    expect(FactoryBot.build(:user, email: '')).to_not be_valid
  end

  it 'メールアドレスが重複していたら登録できない' do
    user1 = FactoryBot.create(:user, name: 'taro', email: 'taro@example.com')
    expect(FactoryBot.build(:user, name: 'ziro', email: user1.email)).to_not be_valid
  end

  it 'メールアドレスに@が文字の間に存在しなければ登録できない' do
    expect(FactoryBot.build(:user, email: 'abc.com@')).to_not be_valid
  end

  it 'パスワードがなければ登録できない' do
    expect(FactoryBot.build(:user, password: '')).to_not be_valid
  end

  it 'password_confirmationとpasswordが異なる場合保存できない' do
    expect(FactoryBot.build(:user, password: 'password', password_confirmation: 'passward')).to_not be_valid
  end

  it 'パスワードが６文字以上でないと登録できない' do
    expect(FactoryBot.build(:user, password: '12345')).to_not be_valid
  end

  it 'パスワードが６文字以上であれば登録できる' do
    expect(FactoryBot.build(:user, password: '123456')).to be_valid
  end

  it '画像がjpg jpeg gif pngであれば投稿できる' do
    expect(FactoryBot.build(:user, img: 'BAF4D34A-067A-4723-A794-8AFA9D9AD14C.jpg')).to be_valid
  end
end
