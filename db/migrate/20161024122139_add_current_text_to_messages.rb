class AddCurrentTextToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :current_text, :text ,null: true
  end
end
