class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates :name, :password, presence: true
  validates :email, format: VALID_EMAIL, uniqueness: true

  def passed_tests_by_level(level)
    tests.by_level(level).where( test_passages: {user_id: id} )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
