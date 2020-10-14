class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

  def profile_edit; end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to posts_index_path, notice: 'プロフィールを更新しました'
    else
      render 'profile_edit'
    end
  end
end
