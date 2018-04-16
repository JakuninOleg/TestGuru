class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :set_question

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

  def terminate!
    current_question = nil
  end

  def result
    (100 * self.correct_questions / test.questions.count)
  end

  def test_passed?
    result >= 85
  end

  def time_over?
    set_timer < Time.now
  end

  def set_timer
    created_at + test.timer
  end

  private

  def set_question
    self.current_question = self.current_question.nil? ? first_question : next_question
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
