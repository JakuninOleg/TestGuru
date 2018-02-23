class User < ApplicationRecord
  def show_passed_tests(difficulty)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id').
    where(level: difficulty, test_passages: { user_id: id })
  end
end
