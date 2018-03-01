class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def passed_tests_by_level(level)
    tests.by_level(level).where( test_passages: {user_id: id} )
  end
end
