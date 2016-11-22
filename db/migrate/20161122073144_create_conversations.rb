class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer  :sender_type
      t.integer  :recipient_type
      t.text :last_message_text
      t.boolean :is_read, default: false
      t.timestamps
    end

    add_index :conversations, [:sender_id, :sender_type]
    add_index :conversations, [:recipient_id, :recipient_type]

  end
end
