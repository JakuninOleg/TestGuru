class User < ApplicationRecord
  def show(difficulty)
    Test.select('tests.title, tests.id').joins('JOIN test_passages ON tests.id = test_passages.test_id').joins('JOIN users ON test_passages.user_id = users.id').where('tests.level = ? AND test_passages.user_id = ?', difficulty, id)
  end
end
