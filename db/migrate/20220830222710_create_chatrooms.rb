class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
