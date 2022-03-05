class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :msg_body, null: false
      t.references :chat, index: true, foreign_key: true
      t.timestamps :send_time, null: false
    end
  end
end
