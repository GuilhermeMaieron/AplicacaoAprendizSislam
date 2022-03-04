class Addcurusertomessage < ActiveRecord::Migration
  def change
    add_column :messages, :cur_user, :integer
  end
end
