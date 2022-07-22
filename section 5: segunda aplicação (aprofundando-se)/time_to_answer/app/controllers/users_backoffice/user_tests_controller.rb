class UsersBackoffice::UserTestsController < UsersBackofficeController

  def index
  end

  def new
    @test = Test.find(params[:test_id])
    @user_test = current_user.user_tests.new
    @user_test.test_answers.build
  end

  def create
    @test = Test.find(params[:test_id])
    @user_test = current_user.user_tests.new(params_user_test)
    @user_test.test = @test
    if @user_test.save!
      redirect_to users_backoffice_tests_path, notice: "Prova Realizada!"
    else
      render :new
    end
  end

  def show
    @user_test = UserTest.find(params[:id])
  end


  private

    def params_user_test
      params.require(:user_test).permit(:test_id, test_answers_attributes: [:answer_id])
    end

end
