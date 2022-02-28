class AddImageUrlToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :imgurl, :string
  end
end
