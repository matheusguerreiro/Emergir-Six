class UsersBackoffice::TestsController < UsersBackofficeController
  before_action :set_test, only: [:make, :result, :show]
  before_action :set_questions, only: [:make, :show]
  before_action :set_result, only: [:result, :show]

  def index
    # console
    @tests = Test.includes(:subject).includes(:questions).page(params[:page])
    @user = User.find(current_user.id)
  end

  def make
  end

  def verify
    test = params[:form_questions]
    test.each do |question_id, answer_id|
      user_test = TestAnswer.new
      user_test.user_id = current_user.id
      user_test.question_id = question_id
      user_test.answer_id = answer_id[0]
      user_test.test_id = params[:id]
      user_test.save!
    end
    redirect_to "/users_backoffice/tests/#{params[:id]}/result"
  end

  def result
    UserTest.set_user_test(current_user.id, @test.id)
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

    def set_result
      questionsIds_answersIds_from_userId_and_testId = TestAnswer.select(:question_id, :answer_id).where(:user_id => current_user.id, :test_id => @test.id).to_a
    
      @questions_and_answers_from_userId = {}

      questionsIds_answersIds_from_userId_and_testId.each do |query|
        @questions_and_answers_from_userId[query.question_id] = query.answer_id
      end

      # corretas
      @corrects = Answer.select(:id).where(:id => @questions_and_answers_from_userId.values, :correct => true).to_a

      # pesos
      heyhey = Question.select(:id, :weight).where(:id => @questions_and_answers_from_userId.keys).to_a

      @weights = {}
      heyhey.each do |w|
        @weights[w.id] = w.weight
      end
      
      test = []
      @corrects.each do |correct|
        response = @questions_and_answers_from_userId.key(correct.id)
        test.push( @weights[response] )
      end

      total = 0
      @weights.values.each do |w|
        total += w
      end

      @final = (test.sum / total.to_f) * 10
    end
end
