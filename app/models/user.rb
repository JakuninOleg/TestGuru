class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :last_name, :first_name, presence: true
  validates :email, uniqueness: true

  def passed_tests_by_level(level)
    tests.by_level(level).where( test_passages: {user_id: id} )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    is_a?(Admin)
  end
end
