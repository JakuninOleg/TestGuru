class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true
end
