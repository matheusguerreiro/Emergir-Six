class Site::SearchController < SiteController
  def questions
    # params[:term]
    # @questions = Question.includes(:answers)
    @questions = Question.search(params[:page], params[:term])
  end
end
