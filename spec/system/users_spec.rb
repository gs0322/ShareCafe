require 'rails_helper'

RSpec.describe "User", type: :system do  
    
        it 'ユーザー登録ができるか' do
            visit   new_user_registration_path
            fill_in "user_name", with: "sota"
            fill_in "user_email", with:  "tester@example.com"
            fill_in "user_password", with: "password"
            fill_in "user_password_confirmation", with: "password"
            find('#hoge').click
            expect(page).to have_content '新規登録が完了しました。'
        end
        it "ログインするとTOP画面に遷移する" do
            user = FactoryBot.create(:user)
            visit root_path
            find('#hoge').click
            fill_in "user_email", with:  "tester@example.com"
            fill_in "user_password", with: "password"
            click_link "ログイン"
        end
    end
