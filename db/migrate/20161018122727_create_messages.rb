class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id,null: false,index:true
      t.integer :recipient_user_id,null: false,index:true
      t.integer :parent_message_id,null: false,index:true,default:0
      t.text :text,null: false
      t.boolean :is_read,null: false,default:false
      t.timestamps null: false
    end
  end
end
