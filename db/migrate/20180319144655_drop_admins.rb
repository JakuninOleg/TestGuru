class DropAdmins < ActiveRecord::Migration[5.1]
  def up
    drop_table :admins
  end
end
