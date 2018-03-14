class AddCurrentquestionToTestpassages < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_passages, :current_question, foreign_key: true
  end
end
