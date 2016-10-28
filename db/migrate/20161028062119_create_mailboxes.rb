class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table	:mailboxes do |t|
      t.integer		:mail_from,index:true, null:false
      t.integer 	:mail_to,index:true, null:false
      t.string 		:to_email, null:false
      t.datetime 	:end_date,null: true
      t.string 		:subject
      t.string 		:topics
      t.text 		:message
      t.timestamps null: false
    end
  end
end
