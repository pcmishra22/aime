class AddForeignKeyConversation < ActiveRecord::Migration
  def change
    add_foreign_key :conversations, :users, column: :sender_id
    add_foreign_key :conversations, :users, column: :recipient_id
  end
end
