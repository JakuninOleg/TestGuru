class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  scope :passed_tests, -> (user, difficulty) { Test.quijoins(:test_passages).
    where(level: difficulty, test_passages: { user_id: user.id }) }

    validates :name, presence: true
    validates :email, presence: true
end
