class Users::RegistrationsController < Devise::RegistrationsController
  before_action :correct_user, only: %i[profile_edit profile_update]

  def profile_edit; end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to posts_path, notice: 'プロフィールを更新しました'
    else
      render 'profile_edit'
    end
  end

  private

    def correct_user
      user = User.find_by(params[:id])
      redirect_to root_url if current_user != user
    end
end
