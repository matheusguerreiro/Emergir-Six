class RemoveQuestionAndAnswerFromUserTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_tests, :question, :integer
    remove_reference :user_tests, :answer, foreign_key: true
  end
end
