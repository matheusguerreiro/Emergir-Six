class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  paginates_per 5

  # def self.search(page, term)
  #   Question.includes(:answers)
  #           .where("lower(description) LIKE ?", "%#{term.downcase}%")
  #           .page(page)
  # end

  scope :_search_, -> (page, term) {
    Question.includes(:answers, :subject)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
  }

  def self.last_questions(page)
    includes(:answers, :subject)
    .order("created_at desc")
    .page(page)
  end

  scope :_search_subject_, -> (page, subject_id) {
    includes(:answers, :subject)
    .where(subject_id: subject_id)
    .page(page)
  }

  # obs: como self é = a Question, podemos tirar o Question fora. exemplo: self.last_questions(page)
  # obs: podemos transformar para scope ao invés de self.search(page, term), somente porque estamos fazendo pesquisa, caso contrário usamos o self.nome(..., ...)

end
