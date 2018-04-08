class CreateTestPassages < ActiveRecord::Migration[5.1]
  def change
    create_table :test_passages do |t|
      t.integer :user_id, foreign_key: true
      t.integer :test_id, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end
