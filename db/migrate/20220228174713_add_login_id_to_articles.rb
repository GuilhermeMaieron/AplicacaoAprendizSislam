class AddLoginIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :login_id, :integer,  index: true, foreign_key: true
  end
end
