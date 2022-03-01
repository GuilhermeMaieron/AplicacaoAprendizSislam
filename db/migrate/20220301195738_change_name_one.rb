class ChangeNameOne < ActiveRecord::Migration
  def change
    rename_table :logins, :users
  end
end
