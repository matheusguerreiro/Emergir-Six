class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_admin, only: [:edit, :update]
  
  def index
    @admins = Admin.all
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "admin Atualizado!"
    else
      render :edit
    end
  end
  
  private
  def password_verify
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
