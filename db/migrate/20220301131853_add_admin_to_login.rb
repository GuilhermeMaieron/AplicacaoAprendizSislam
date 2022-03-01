class AddAdminToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :admin, :boolean, default:false, null: false
  end
end
