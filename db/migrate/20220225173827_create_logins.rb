class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :username
      t.string :email
      t.string :senha
      t.date :idade

      t.timestamps null: false
    end
  end
end
