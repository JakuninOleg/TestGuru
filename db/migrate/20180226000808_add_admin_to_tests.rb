class AddAdminToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :admin_id, :integer
  end
end
