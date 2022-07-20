class AddUserTestToTestAnswer < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_answers, :user_test, foreign_key: true
  end
end
