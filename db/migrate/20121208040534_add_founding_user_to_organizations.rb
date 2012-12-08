class AddFoundingUserToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :founding_user_id, :integer, :null => false
  end
end
