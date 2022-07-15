class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_test, only: [:make]

  def index
    @tests = Test.includes(:subject).includes(:questions).order(:created_at).page(params[:page])
  end

  def make
    @questions = @test.questions.to_a
  end

  def verify
    
  end

  private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:subject_id, :id)
    end
end
