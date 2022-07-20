class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  has_many :test_answers
  has_many :answers, through: :test_answers

  def self.set_user_test(current_user, test_id)
    user_test = UserTest.new
    user_test.user_id = current_user
    user_test.test_id = test_id
    user_test.save!
  end
end
