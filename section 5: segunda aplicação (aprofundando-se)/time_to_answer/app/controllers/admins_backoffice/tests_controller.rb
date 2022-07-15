class AdminsBackoffice::TestsController < AdminsBackofficeController
  before_action :set_test, only: [:edit, :update, :destroy]
  before_action :get_subjects, only: [:edit, :new]
  before_action :get_questions, only: [:edit, :new]

  def index
    @tests = Test.includes(:subject).includes(:questions).order(:created_at).page(params[:page])
  end

  def new
    @test = Test.new
  end

  def edit
    questions_ids = @test.question_ids
    @questions = Question.find(questions_ids)
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
    if params[:test]
      if @test.update(test_params)
        redirect_to admins_backoffice_tests_path, notice: "Prova atualizada!"
      else
        render :edit
      end
    else
      redirect_to edit_admins_backoffice_test_path, notice: "Prova sem questões!"
    end
  end

  def destroy
    @test.questions.clear
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

  def get_questions
    @questions = Question.all
  end

  def test_params
    params.require(:test).permit(:description, :subject_id, question_ids: [])
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
