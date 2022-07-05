class Site::SearchController < SiteController
  def questions
    # params[:term]
    # @questions = Question.includes(:answers)
    @questions = Question._search_(params[:page], params[:term])
  end
end
