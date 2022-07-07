class UsersBackoffice::ProfileController < UsersBackofficeController
  def edit
    @user = User.last
  end
end
