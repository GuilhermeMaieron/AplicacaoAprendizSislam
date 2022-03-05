class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user, foreign_key: :sender_id
  validates :msg_body, null: false, length: { minimum: 1 }
end
