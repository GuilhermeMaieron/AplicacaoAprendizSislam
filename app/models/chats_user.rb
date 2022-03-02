class ChatsUser < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user
end
