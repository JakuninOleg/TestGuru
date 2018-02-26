class Question < ApplicationRecord
  has_many :answers

  belongs_to :test

  validates :body, presence: true

  validate :validate_questions

  private

  def validate_questions
    errors.add(:answers, 'Неверное количество ответов') if answers.size != 1..4
  end
end
