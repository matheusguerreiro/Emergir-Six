class AdminsBackoffice::TestsController < AdminsBackofficeController
  before_action :set_test, only: [:edit, :update, :destroy]
  before_action :get_subjects, only: [:edit, :new]

  def index
    @tests = Test.includes(:subject).order(:description).page(params[:page])
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admins_backoffice_tests_path, notice: "Prova cadastrada!"
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admins_backoffice_tests_path, notice: "Prova atualizada!"
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to admins_backoffice_tests_path, notice: "Prova deletada!"
    else
      render :index
    end
  end


  private
  def get_subjects
    @subjects = Subject.all
  end

  def test_params
    params.require(:test).permit(:description, :subject_id, question_ids: [])
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
