require 'rails_helper'

RSpec.describe Post, type: :model do
  it '店名とレビューと画像と評価と住所があれば投稿できる' do
    expect(FactoryBot.create(:post)).to be_valid
  end

  it '店名がなければ投稿できない' do
    expect(FactoryBot.build(:post, title: '')).to_not be_valid
  end

  it '店名が30文字以内でなければ投稿できない' do
    expect(FactoryBot.build(:post, title: ('a' * 31))).to_not be_valid
  end

  it 'レビューがなければ投稿できない' do
    expect(FactoryBot.build(:post, text: '')).to_not be_valid
  end

  it 'レビューが200文字以内でなければ投稿できない' do
    expect(FactoryBot.build(:post, text: ('a' * 201))).to_not be_valid
  end

  it '画像がなければ投稿できない' do
    expect(FactoryBot.build(:post, img: '')).to_not be_valid
  end

  it '評価がなければ投稿できない' do
    expect(FactoryBot.build(:post, rate: '')).to_not be_valid
  end

  it '住所がなければ投稿できない' do
    expect(FactoryBot.build(:post, address: '')).to_not be_valid
  end

  it 'ハッシュタグがなくても投稿できる' do
    expect(FactoryBot.build(:post, hashbody: '')).to be_valid
  end
end