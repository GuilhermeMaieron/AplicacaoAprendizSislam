class AddDataColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :data, :date

  end
end
