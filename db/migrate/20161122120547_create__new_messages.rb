class CreateNewMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :message
      t.string :attachment_url
      t.string :ip
      t.timestamps
    end

    #add_reference :messages, :conversation, references: :conversations, index: true
    #add_foreign_key :conversations, :conversations

  end
end
