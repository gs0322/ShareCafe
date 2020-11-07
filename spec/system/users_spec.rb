require 'rails_helper'

RSpec.describe "User", type: :system do  
    
    context 'ユーザー登録前' do
        it 'ユーザー登録ができるか' do
            visit   new_user_registration_path
            fill_in "user_name", with: "山田太郎"
            fill_in "user_email", with: "a@example.com"
            fill_in "user_password", with: "123456"
            fill_in "user_password_confirmation", with: "123456"
            find('#hoge').click
            expect(page).to have_content '新規登録が完了しました。'
        end
    end
end
