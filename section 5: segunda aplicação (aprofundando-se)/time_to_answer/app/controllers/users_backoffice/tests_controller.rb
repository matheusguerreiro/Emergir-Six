class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_test, only: [:make, :result, :show]
  before_action :set_questions, only: [:make, :show]
  before_action :set_result, only: [:result, :show]

  def index
    @tests = Test.includes(:subject).includes(:questions).page(params[:page])
  end

  def show

  end


  private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:form_questions).permit!
    end

    def set_questions
      @questions = @test.questions.to_a
    end

    
end
