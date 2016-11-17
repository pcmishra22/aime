class AddUserToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :user, foreign_key: true
    add_index(:students, :user_id, :unique => true)
  end
end
