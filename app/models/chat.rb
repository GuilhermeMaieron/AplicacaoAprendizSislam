class Chat < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :chats_users
  has_many :users, through: :chats_users
  validates :chat_name, null: false, length: { minimum: 1 }
end
