class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :image
      t.string :rule

      t.timestamps
    end
  end
end
