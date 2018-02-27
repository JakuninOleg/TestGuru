class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :quantity
  validates :body, presence: true

  private

  def quantity
    if question.answers.size >= 4
      errors.add(:Количество, "Нельзя добавить больше 4-х ответов")
    end
  end
end
