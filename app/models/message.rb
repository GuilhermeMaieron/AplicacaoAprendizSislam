class Message < ActiveRecord::Base
  belongs_to :chat
  validates :msg_body, null: false, length: { minimum: 1 }
end
