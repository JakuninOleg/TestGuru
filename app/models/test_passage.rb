class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :set_question
  before_update :test_passed

  scope :correct_passed_tests, -> (user) {
    user.test_passages.where(passed: true)
  }

  scope :passed_by_level, -> (user, level) { user.test_passages.
    joins(:test).where(tests: { level: level })}

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_number
    number_of_questions - test_questions.count
  end

  def number_of_questions
    test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def result
    (100 * self.correct_questions / test.questions.count)
  end

  def test_passed?
    result >= 85
  end

  private

  def test_passed
    self.passed = test_passed? if completed?
  end

  def set_question
    self.current_question = self.completed? ? first_question : next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers_count == correct_answers.where(id: answer_ids).count &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def first_question
    test.questions.first
  end

  def next_question
    test_questions.first
  end

  def test_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
