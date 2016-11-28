class UpdateMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender_type, :integer
  end
end
