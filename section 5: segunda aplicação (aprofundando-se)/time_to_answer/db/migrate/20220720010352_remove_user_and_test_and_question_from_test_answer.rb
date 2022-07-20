class RemoveUserAndTestAndQuestionFromTestAnswer < ActiveRecord::Migration[5.2]
  def change
    remove_reference :test_answers, :user, foreign_key: true
    remove_reference :test_answers, :test, foreign_key: true
    remove_reference :test_answers, :question, foreign_key: true
  end
end
