class AdminsBackoffice::TestQuestionsController < AdminsBackofficeController
  def index
    @questions = Question.where(subject_id: params[:id]).all
    @test = Test.find(params[:test])
  end

  private
  def test_params
    params.require(:test).permit(:subject_id, :id)
  end
end
