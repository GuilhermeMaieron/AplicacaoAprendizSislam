class ChangeLoginIdtouser < ActiveRecord::Migration
 def change
    rename_column :articles, :login_id, :user_id
    rename_column :comments, :c_login_id, :c_user_id
  end
end
