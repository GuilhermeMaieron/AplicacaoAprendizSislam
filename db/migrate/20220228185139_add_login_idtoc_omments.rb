class AddLoginIdtocOmments < ActiveRecord::Migration
  def change
    add_column :comments, :c_login_id, :integer,  index: true, foreign_key: true
  end
end
