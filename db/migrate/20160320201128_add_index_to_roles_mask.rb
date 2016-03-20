class AddIndexToRolesMask < ActiveRecord::Migration
  def change
    add_index :users, :roles_mask
  end
end
