class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id, foreign_key: true

      t.timestamps
    end
  end
end
