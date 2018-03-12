class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :test_id, foreign_key: true

      t.timestamps
    end
  end
end
