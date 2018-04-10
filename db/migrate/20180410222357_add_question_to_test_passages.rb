class AddQuestionToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key "test_passages", "questions", column: "current_question_id"
  end
end
