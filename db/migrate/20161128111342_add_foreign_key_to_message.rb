class AddForeignKeyToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :conversation, index: true
    add_foreign_key :messages, :conversations
  end
end
