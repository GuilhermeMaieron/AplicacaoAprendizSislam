class CreateChatsUsers < ActiveRecord::Migration
  def change
    create_table :chats_users do |t|
      t.belongs_to :chat
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
