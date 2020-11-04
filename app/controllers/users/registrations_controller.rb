class Users::RegistrationsController < Devise::RegistrationsController
  def profile_edit; end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to posts_path, notice: 'プロフィールを更新しました'
    else
      render 'profile_edit'
    end
  end
end
