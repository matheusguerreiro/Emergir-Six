class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_user

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to users_backoffice_profile_path, notice: "User atualizado"
    else
      render :edit
    end
  end


  private

  def password_verify
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
